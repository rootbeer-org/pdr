import argparse
import hashlib
import json
import os
from pathlib import Path, PurePosixPath
import re
import shutil
import subprocess
import tarfile
import tempfile
import zipfile


DIGEST = r'[0-9a-f]{64}'
RESULT_FILE = re.compile(
    rf'(?:{DIGEST}/(?:record\.json|receipts/{DIGEST}\.json|artifacts/{DIGEST}\.tar\.gz)'
    rf'|builds/results/{DIGEST}/(?:receipt\.json|package\.tar\.gz))'
)


def identity(runner, context, engine_revision, recheck):
    if not re.fullmatch(r'[0-9a-f]{40}', engine_revision):
        raise ValueError('invalid engine revision')
    if not re.fullmatch(DIGEST, context):
        raise ValueError('invalid build environment identity')
    return {
        'schema': 1,
        'repository': os.environ['GITHUB_REPOSITORY'],
        'run_id': int(os.environ['GITHUB_RUN_ID']),
        'source_revision': os.environ['GITHUB_SHA'],
        'runner': runner,
        'environment': context,
        'engine_revision': engine_revision,
        'recheck': recheck,
    }


def regular_file(path):
    if path.is_symlink() or not path.is_file():
        raise ValueError(f'checkpoint requires regular files: {path}')


def result_files(cache):
    if not cache.exists():
        return []
    if cache.is_symlink() or not cache.is_dir():
        raise ValueError('result cache must be a directory')
    files = []
    for directory, directories, names in os.walk(cache, followlinks=False):
        relative = Path(directory).relative_to(cache)
        allowed = []
        for name in directories:
            path = Path(directory) / name
            child = relative / name
            if relative == Path('.') and not (re.fullmatch(DIGEST, name) or name == 'builds'):
                continue
            if relative == Path('builds') and name != 'results':
                continue
            if path.is_symlink():
                raise ValueError(f'checkpoint rejects symlink directories: {child}')
            allowed.append(name)
        directories[:] = sorted(allowed)
        for name in sorted(names):
            path = Path(directory) / name
            member = path.relative_to(cache).as_posix()
            if not RESULT_FILE.fullmatch(member):
                continue
            regular_file(path)
            files.append((member, path))
    return files


def discard_previous_results(cache):
    if not cache.exists():
        return
    result_files(cache)
    paths = [path for path in cache.iterdir() if re.fullmatch(DIGEST, path.name)]
    builds = cache / 'builds'
    if builds.is_symlink():
        raise ValueError('build cache must not be a symlink')
    if (builds / 'results').exists():
        paths.append(builds / 'results')
    for path in paths:
        if path.is_symlink() or not path.is_dir():
            raise ValueError('cache result must be a directory')
    for path in paths:
        shutil.rmtree(path)


def checkpoint(cache, output, expected):
    files = result_files(cache)
    if not any(name.endswith('/record.json') or name.endswith('/receipt.json') for name, _ in files):
        return False
    output.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=output.parent) as directory:
        staging = Path(directory)
        (staging / 'checkpoint.json').write_text(json.dumps(expected, sort_keys=True))
        archive = staging / 'package-results.tar'
        with tarfile.open(archive, 'w') as bundle:
            bundle.add(staging / 'checkpoint.json', arcname='checkpoint.json', recursive=False)
            for name, path in files:
                bundle.add(path, arcname=name, recursive=False)
        archive.replace(output)
    return True


def restore_archive(archive, cache, expected):
    with tempfile.TemporaryDirectory(dir=cache.parent) as directory:
        staging = Path(directory)
        with tarfile.open(archive, 'r:') as bundle:
            names = set()
            members = bundle.getmembers()
            for member in members:
                if member.name in names or not member.isfile():
                    raise ValueError('checkpoint has duplicate or non-regular entries')
                names.add(member.name)
                if member.name != 'checkpoint.json' and not RESULT_FILE.fullmatch(member.name):
                    raise ValueError(f'unexpected checkpoint path: {member.name}')
            if 'checkpoint.json' not in names:
                raise ValueError('checkpoint has no producer metadata')
            with bundle.extractfile('checkpoint.json') as metadata:
                actual = json.load(metadata)
            if actual != expected:
                if dict(actual, environment=expected['environment']) == expected:
                    print('Checkpoint build environment changed; leaving it unused.')
                    return 0
                raise ValueError('checkpoint does not match this run and producer')
            for member in members:
                if member.name == 'checkpoint.json':
                    continue
                path = staging / member.name
                path.parent.mkdir(parents=True, exist_ok=True)
                with bundle.extractfile(member) as source, path.open('xb') as destination:
                    shutil.copyfileobj(source, destination)
        entries = sorted({PurePosixPath(name).parts[:3] if name.startswith('builds/')
                          else PurePosixPath(name).parts[:1]
                          for name in names if name != 'checkpoint.json'})
        for parts in entries:
            relative = Path(*parts)
            marker = 'receipt.json' if parts[0] == 'builds' else 'record.json'
            regular_file(staging / relative / marker)
            destination = cache / relative
            for parent in [cache, *list(destination.parents)[:len(parts) - 1]]:
                if parent.is_symlink() or (parent.exists() and not parent.is_dir()):
                    raise ValueError('cache destination must contain only directories')
            if destination.is_symlink():
                raise ValueError('cache result destination must not be a symlink')
        for parts in entries:
            relative = Path(*parts)
            destination = cache / relative
            destination.parent.mkdir(parents=True, exist_ok=True)
            if destination.exists():
                shutil.rmtree(destination)
            shutil.move(staging / relative, destination)
    return len(entries)


def api(path):
    return json.loads(subprocess.check_output(['gh', 'api', path]))


def previous_checkpoint(repository, run_id, runner, attempt):
    pattern = re.compile(rf'package-results-{re.escape(runner)}-([0-9]+)')
    candidates = []
    page = 1
    while True:
        artifacts = api(f'repos/{repository}/actions/runs/{run_id}/artifacts?per_page=100&page={page}')['artifacts']
        for artifact in artifacts:
            match = pattern.fullmatch(artifact['name'])
            if match and 0 < int(match[1]) < attempt and not artifact['expired']:
                candidates.append((int(match[1]), artifact))
        if len(artifacts) < 100:
            break
        page += 1
    if not candidates:
        return None
    latest = max(number for number, _ in candidates)
    matches = [artifact for number, artifact in candidates if number == latest]
    if len(matches) != 1:
        raise ValueError('expected one checkpoint for the previous attempt')
    return matches[0]


def restore(cache, expected, attempt):
    if attempt == 1:
        return
    artifact = previous_checkpoint(expected['repository'], expected['run_id'], expected['runner'], attempt)
    if artifact is None:
        print('No checkpoint from an earlier attempt; using the branch-scoped cache.')
        return
    digest = artifact.get('digest', '')
    if not re.fullmatch(rf'sha256:{DIGEST}', digest):
        raise ValueError('checkpoint artifact has no SHA-256 digest')
    with tempfile.TemporaryDirectory() as directory:
        archive = Path(directory) / 'artifact.zip'
        endpoint = f"repos/{expected['repository']}/actions/artifacts/{int(artifact['id'])}/zip"
        with archive.open('wb') as output:
            subprocess.run(['gh', 'api', endpoint, '--allow-escape-sequences'], stdout=output, check=True)
        hasher = hashlib.sha256()
        with archive.open('rb') as source:
            for chunk in iter(lambda: source.read(1024 * 1024), b''):
                hasher.update(chunk)
        if hasher.hexdigest() != digest.removeprefix('sha256:'):
            raise ValueError('checkpoint artifact digest mismatch')
        with zipfile.ZipFile(archive) as bundle:
            if bundle.namelist() != ['package-results.tar']:
                raise ValueError('unexpected checkpoint artifact contents')
            checkpoint_path = Path(directory) / 'package-results.tar'
            with bundle.open('package-results.tar') as source, checkpoint_path.open('wb') as output:
                shutil.copyfileobj(source, output)
        count = restore_archive(checkpoint_path, cache, expected)
    print(f"Restored {count} package results from {artifact['name']}; Forge verifies compatibility and content before reuse.")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('operation', choices=['save', 'restore'])
    parser.add_argument('--runner', required=True)
    parser.add_argument('--context', required=True)
    parser.add_argument('--engine-revision', required=True)
    parser.add_argument('--recheck', action='store_true')
    args = parser.parse_args()
    expected = identity(args.runner, args.context, args.engine_revision, args.recheck)
    cache = Path('.package-results')
    if args.operation == 'restore':
        if args.recheck:
            discard_previous_results(cache)
        restore(cache, expected, int(os.environ['GITHUB_RUN_ATTEMPT']))
        return
    has_results = checkpoint(cache, Path('package-checkpoint/package-results.tar'), expected)
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'has-results={str(has_results).lower()}\n')


if __name__ == '__main__':
    main()
