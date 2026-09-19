import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile
import zipfile

spec = importlib.util.spec_from_file_location('candidate_store', Path(__file__).with_name('candidate-store.py'))
store = importlib.util.module_from_spec(spec)
spec.loader.exec_module(store)
WORKFLOWS = {'.github/workflows/packages.yml', '.github/workflows/discovery.yml', '.github/workflows/publish.yml'}


def api(path):
    return json.loads(store.command('gh', 'api', path))


def pages(path, field):
    result = []
    page = 1
    while True:
        entries = api(f'{path}?per_page=100&page={page}')[field]
        result.extend(entries)
        if len(entries) < 100:
            return result
        page += 1


def revision(value):
    if not re.fullmatch(r'[0-9a-f]{40}', value):
        raise ValueError('invalid source revision')
    return value


def fetch(sha):
    subprocess.run(['git', 'fetch', '--no-tags', 'origin', revision(sha)], check=True)


def same_verifier(source, trusted):
    for path in ['engine-revision', '.github/workflows', '.github/actions', '.github/scripts']:
        if store.command('git', 'rev-parse', f'{source}:{path}') != store.command('git', 'rev-parse', f'{trusted}:{path}'):
            raise ValueError(f'producer differs from the trusted verifier: {path}')


def admit(run, repository, trusted):
    if run.get('path') not in WORKFLOWS or run.get('head_repository', {}).get('full_name') != repository:
        raise ValueError('untrusted producer workflow or repository')
    if run.get('status') not in ['completed', 'in_progress']:
        raise ValueError('producer has not run verification')
    source = revision(run['head_sha'])
    fetch(source)
    same_verifier(source, trusted)
    event = run.get('event')
    if event == 'pull_request':
        if run['path'] != '.github/workflows/packages.yml':
            raise ValueError('unexpected pull request producer')
        pulls = api(f'repos/{repository}/commits/{source}/pulls')
        matching = [pull for pull in pulls if pull.get('head', {}).get('sha') == source
                    and pull.get('head', {}).get('repo', {}).get('full_name') == repository
                    and pull.get('base', {}).get('ref') == 'main']
        if len(matching) != 1:
            raise ValueError('producer must be a same-repository pull request targeting main')
        base = revision(matching[0]['base']['sha'])
        fetch(base)
        base = revision(store.command('git', 'merge-base', source, base))
        same_verifier(source, base)
    elif event not in ['push', 'schedule', 'workflow_dispatch', 'repository_dispatch', 'workflow_run'] or run.get('head_branch') != 'main':
        raise ValueError('producer must verify main or an admitted pull request')
    jobs = pages(f"repos/{repository}/actions/runs/{run['id']}/jobs", 'jobs')
    if not any(job['name'].split(' / ')[-1] == 'assemble' and job.get('conclusion') == 'success' for job in jobs):
        raise ValueError('producer has no successful complete assembly')
    return source


def download(repository, artifact, destination, prefix):
    digest = artifact.get('digest', '')
    if artifact.get('expired') or not re.fullmatch(store.DIGEST, digest):
        raise ValueError('producer artifact is expired or lacks a digest')
    with tempfile.TemporaryDirectory() as directory:
        archive = Path(directory) / 'artifact.zip'
        with archive.open('wb') as output:
            subprocess.run(['gh', 'api', f"repos/{repository}/actions/artifacts/{int(artifact['id'])}/zip",
                            '--allow-escape-sequences'], stdout=output, check=True)
        hasher = hashlib.sha256()
        with archive.open('rb') as source:
            for chunk in iter(lambda: source.read(1024 * 1024), b''):
                hasher.update(chunk)
        if 'sha256:' + hasher.hexdigest() != digest:
            raise ValueError('producer artifact digest mismatch')
        with zipfile.ZipFile(archive) as bundle:
            names = set()
            for member in bundle.infolist():
                if member.is_dir():
                    continue
                path = f'{prefix}/{member.filename}'
                if not store.FILE.fullmatch(path) or path in names or (member.external_attr >> 16) & 0o170000 == 0o120000:
                    raise ValueError('unsafe or duplicate producer artifact path')
                names.add(path)
            for member in bundle.infolist():
                if member.is_dir():
                    continue
                path = destination / prefix / member.filename
                path.parent.mkdir(parents=True, exist_ok=True)
                with bundle.open(member) as source, path.open('xb') as output:
                    shutil.copyfileobj(source, output)


def source_recipes(source, directory):
    entries = subprocess.check_output(['git', 'ls-tree', '-rz', revision(source), 'packages']).split(b'\0')
    directory.mkdir()
    for entry in entries:
        if not entry:
            continue
        metadata, path = entry.decode().split('\t', 1)
        mode, kind, _ = metadata.split()
        if not re.fullmatch(r'packages/[a-z0-9][a-z0-9+._-]*\.lua', path) or mode not in ['100644', '100755'] or kind != 'blob':
            raise ValueError('source catalog must contain regular canonical recipe files')
        contents = subprocess.check_output(['git', 'show', f'{source}:{path}'])
        (directory / Path(path).name).write_bytes(contents)


def collect(run_id, engine, destination):
    repository = store.repository()
    run = api(f'repos/{repository}/actions/runs/{run_id}')
    trusted = revision(store.command('git', 'rev-parse', 'HEAD'))
    source = admit(run, repository, trusted)
    artifacts = pages(f'repos/{repository}/actions/runs/{run_id}/artifacts', 'artifacts')
    required = {'verified-bundle': 'bundle'}
    if run['path'] == '.github/workflows/discovery.yml':
        required['upstream-candidates'] = 'discovery'
    evidence = []
    destination.mkdir()
    for name, prefix in required.items():
        matches = [artifact for artifact in artifacts if artifact['name'] == name and not artifact['expired']]
        if len(matches) != 1:
            raise ValueError(f'expected one retained {name}; repair evidence without rebuilding accepted packages')
        artifact = matches[0]
        download(repository, artifact, destination, prefix)
        evidence.append({key: artifact[key] for key in ['id', 'name', 'digest']})
    with tempfile.TemporaryDirectory() as directory:
        catalog = Path(directory) / 'packages'
        if 'upstream-candidates' in required:
            catalog = destination / 'discovery/packages'
        else:
            source_recipes(source, catalog)
        subprocess.run([engine, '--catalog', str(catalog), 'verify-candidate', str(destination / 'bundle')], check=True)
        digest = store.catalog_digest(engine, catalog)
    metadata = {
        'schema': 1, 'repository': repository, 'catalog_sha256': digest,
        'producer': {'run_id': int(run_id), 'attempt': run['run_attempt'], 'revision': source,
                     'workflow': run['path'], 'event': run['event']},
        'verifier_revision': trusted,
        'engine_revision': revision(Path('engine-revision').read_text().strip()),
        'artifacts': evidence,
    }
    (destination / 'candidate.json').write_text(json.dumps(metadata, sort_keys=True, separators=(',', ':')))
    reference = store.push(destination, f"run-{run_id}-{run['run_attempt']}", run['created_at'])
    subprocess.run(['oras', 'tag', reference, reference.split('@')[1].replace(':', '-')], check=True)
    store.output('reference', reference)
    store.output('digest', reference.split('@')[1])
    store.output('catalog_sha256', digest)
    return reference


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--run', required=True, type=int)
    parser.add_argument('--probe', action='store_true')
    parser.add_argument('--engine', default='engine/target/release/rootbeer-forge')
    parser.add_argument('--output', type=Path, default=Path('retained'))
    args = parser.parse_args()
    if args.run <= 0:
        raise ValueError('invalid producer run')
    if args.probe:
        jobs = pages(f'repos/{store.repository()}/actions/runs/{args.run}/jobs', 'jobs')
        has_assembly = any(job['name'].split(' / ')[-1] == 'assemble' and job.get('conclusion') == 'success' for job in jobs)
        store.output('ready', str(has_assembly).lower())
        return
    collect(args.run, args.engine, args.output)


if __name__ == '__main__':
    main()
