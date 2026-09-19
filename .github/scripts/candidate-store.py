import argparse
import hashlib
import json
import os
from pathlib import Path
import re
import subprocess
import tempfile


ARTIFACT_TYPE = 'application/vnd.rootbeer.candidate.v1'
APPROVAL_TYPE = 'https://rootbeer.tale.me/attestations/catalog-approval/v1'
DIGEST = r'sha256:[0-9a-f]{64}'
VERIFIER_INPUTS = ('engine-revision', '.github/workflows', '.github/actions', '.github/scripts')
FILE = re.compile(r'(?:candidate\.json|bundle/index\.json|bundle/(?:receipts|qualifications)/[0-9a-f]{64}\.json|bundle/artifacts/[0-9a-f]{64}\.tar\.gz|discovery/(?:report\.json|summary\.md|packages/[a-z0-9][a-z0-9+._-]*\.lua))')


def command(*args, **kwargs):
    return subprocess.check_output(args, text=True, **kwargs).strip()


def repository():
    value = os.environ['GITHUB_REPOSITORY']
    if not re.fullmatch(r'[a-zA-Z0-9_.-]+/[a-zA-Z0-9_.-]+', value):
        raise ValueError('invalid repository')
    return value


def registry():
    return f'ghcr.io/{repository().lower()}/results'


def pinned(reference):
    if not re.fullmatch(re.escape(registry()) + '@' + DIGEST, reference):
        raise ValueError('candidate must use a digest in this repository’s result registry')
    return reference


def output(name, value):
    if '\n' in str(value):
        raise ValueError('invalid workflow output')
    with open(os.environ['GITHUB_OUTPUT'], 'a') as destination:
        destination.write(f'{name}={value}\n')


def resolve(tag):
    if not re.fullmatch(r'[a-z0-9][a-z0-9.-]*', tag):
        raise ValueError('invalid candidate tag')
    result = subprocess.run(['oras', 'resolve', f'{registry()}:{tag}'], capture_output=True, text=True)
    if result.returncode:
        if re.search(r'(MANIFEST_UNKNOWN|NAME_UNKNOWN|: not found(?:\n|$))', result.stderr):
            return None
        raise RuntimeError(f'cannot resolve candidate: {result.stderr}')
    return pinned(f'{registry()}@{result.stdout.strip()}')


def verify_provenance(reference, approved=False):
    workflow = 'publish.yml' if approved else 'retain-results.yml'
    args = ['gh', 'attestation', 'verify', 'oci://' + pinned(reference), '--repo', repository(),
            '--signer-workflow', f'{repository()}/.github/workflows/{workflow}',
            '--source-ref', 'refs/heads/main', '--deny-self-hosted-runners', '--bundle-from-oci']
    if approved:
        args.extend(['--predicate-type', APPROVAL_TYPE])
    return json.loads(command(*args, '--format', 'json'))


def pull_files(reference, destination, engine=None):
    manifest_bytes = subprocess.check_output(['oras', 'manifest', 'fetch', pinned(reference)])
    if 'sha256:' + hashlib.sha256(manifest_bytes).hexdigest() != reference.split('@')[1]:
        raise ValueError('candidate manifest digest mismatch')
    manifest = json.loads(manifest_bytes)
    if manifest.get('artifactType') != ARTIFACT_TYPE:
        raise ValueError('unexpected OCI artifact type')
    names = set()
    layers = manifest.get('layers', [])
    for layer in layers:
        name = layer.get('annotations', {}).get('org.opencontainers.image.title', '')
        if not FILE.fullmatch(name) or name in names or not re.fullmatch(DIGEST, layer.get('digest', '')):
            raise ValueError('invalid or duplicate candidate layer')
        if not isinstance(layer.get('size'), int) or layer['size'] < 0:
            raise ValueError('invalid candidate layer size')
        names.add(name)
    if not {'candidate.json', 'bundle/index.json'} <= names:
        raise ValueError('candidate is missing its manifest or bundle index')
    if destination.exists():
        raise ValueError('candidate destination already exists')
    destination.parent.mkdir(parents=True, exist_ok=True)
    with tempfile.TemporaryDirectory(dir=destination.parent) as temporary:
        staging = Path(temporary) / 'candidate'
        staging.mkdir()
        for folder in ['artifacts', 'receipts', 'qualifications']:
            (staging / 'bundle' / folder).mkdir(parents=True)
        by_name = {layer['annotations']['org.opencontainers.image.title']: layer for layer in layers}
        metadata_names = {name for name in names if name in ['candidate.json', 'bundle/index.json']
                          or name.startswith('bundle/qualifications/')}
        for name in sorted(metadata_names):
            fetch_layer(by_name[name], staging)
        selected = names - metadata_names
        if engine:
            plan = json.loads(command(engine, 'candidate-files', str(staging / 'bundle')))
            if plan.get('schema') != 1 or plan.get('system') not in ['aarch64-macos', 'aarch64-linux', 'x86_64-linux']:
                raise ValueError('invalid candidate transfer plan')
            selected = {'bundle/' + name for name in plan['files']}
            if not selected <= names or any(not FILE.fullmatch(name) for name in selected):
                raise ValueError('candidate is missing required platform layers')
        for name in sorted(selected):
            fetch_layer(by_name[name], staging)
        staging.rename(destination)
    return json.loads((destination / 'candidate.json').read_text())


def fetch_layer(layer, directory):
    path = directory / layer['annotations']['org.opencontainers.image.title']
    path.parent.mkdir(parents=True, exist_ok=True)
    subprocess.run(['oras', 'blob', 'fetch', '--output', str(path), registry() + '@' + layer['digest']], check=True)
    digest = hashlib.sha256()
    with path.open('rb') as source:
        for chunk in iter(lambda: source.read(1024 * 1024), b''):
            digest.update(chunk)
    if path.stat().st_size != layer['size'] or 'sha256:' + digest.hexdigest() != layer['digest']:
        raise ValueError('candidate layer digest or size mismatch')


def metadata(directory):
    value = json.loads((directory / 'candidate.json').read_text())
    producer = value.get('producer', {})
    if value.get('schema') != 1 or value.get('repository') != repository():
        raise ValueError('candidate schema or repository mismatch')
    for field, length in [('catalog_sha256', 64), ('engine_revision', 40), ('verifier_revision', 40)]:
        if not re.fullmatch(r'[0-9a-f]{%d}' % length, value.get(field, '')):
            raise ValueError('invalid candidate ' + field)
    if not re.fullmatch(r'[0-9a-f]{40}', producer.get('revision', '')):
        raise ValueError('invalid producer revision')
    if producer.get('workflow') not in ['.github/workflows/packages.yml', '.github/workflows/discovery.yml', '.github/workflows/publish.yml']:
        raise ValueError('unexpected producer workflow')
    for field in ['run_id', 'attempt']:
        if type(producer.get(field)) is not int or producer[field] <= 0:
            raise ValueError('invalid producer ' + field)
    return value


def verify_approval(attestations, metadata):
    for attestation in attestations:
        statement = attestation.get('verificationResult', {}).get('statement', {})
        predicate = statement.get('predicate', {})
        if (statement.get('predicateType') == APPROVAL_TYPE and predicate.get('schema') == 1
                and predicate.get('repository') == repository()
                and predicate.get('catalog_sha256') == metadata['catalog_sha256']
                and re.fullmatch(r'[0-9a-f]{40}', predicate.get('revision', ''))):
            return
    raise ValueError('candidate has no matching catalog approval')


def pull(reference, destination, approved=False, engine=None):
    verify_provenance(reference)
    attestations = verify_provenance(reference, approved=True) if approved else None
    pull_files(reference, destination, engine=engine)
    value = metadata(destination)
    if approved:
        verify_approval(attestations, value)
    return value


def catalog_digest(engine, catalog):
    result = command(engine, '--catalog', str(catalog), 'check')
    match = re.fullmatch(r'[0-9]+ packages; sha256:([0-9a-f]{64})', result)
    if not match:
        raise ValueError('unexpected catalog check output')
    return match[1]


def push(directory, tag, created):
    if not re.fullmatch(r'[a-z0-9][a-z0-9.-]*', tag):
        raise ValueError('invalid candidate tag')
    files = []
    for path in sorted(directory.rglob('*')):
        if path.is_symlink():
            raise ValueError('candidate files must not be symlinks')
        if path.is_dir():
            continue
        relative = path.relative_to(directory).as_posix()
        if not path.is_file() or not FILE.fullmatch(relative):
            raise ValueError(f'unexpected candidate file: {relative}')
        files.append(relative + ':application/octet-stream')
    manifest = directory.parent / 'oci-manifest.json'
    subprocess.run(['oras', 'push', '--artifact-type', ARTIFACT_TYPE,
                    '--annotation', f'org.opencontainers.image.created={created}',
                    '--annotation', f'org.opencontainers.image.source=https://github.com/{repository()}',
                    '--export-manifest', str(manifest.resolve()), f'{registry()}:{tag}', *files],
                   cwd=directory, check=True)
    return pinned(registry() + '@sha256:' + hashlib.sha256(manifest.read_bytes()).hexdigest())


def revision(value):
    if not re.fullmatch(r'[0-9a-f]{40}', value):
        raise ValueError('invalid source revision')
    return value


def same_inputs(source, target, paths=VERIFIER_INPUTS):
    return all(command('git', 'rev-parse', f'{source}:{path}') ==
               command('git', 'rev-parse', f'{target}:{path}') for path in paths)


def promote(value, directory, engine, catalog):
    if os.environ.get('GITHUB_REF') != 'refs/heads/main':
        raise ValueError('promotion must run on main')
    producer = value['producer']
    run_id = producer['run_id']
    run = json.loads(command('gh', 'api', f'repos/{repository()}/actions/runs/{run_id}'))
    if (run['path'] != '.github/workflows/discovery.yml' or producer['workflow'] != run['path']
            or run['head_repository']['full_name'] != repository() or run['head_branch'] != 'main'
            or run['event'] not in ['push', 'schedule', 'workflow_dispatch', 'repository_dispatch']
            or run['status'] != 'completed' or run['conclusion'] != 'success'
            or run['head_sha'] != producer['revision']):
        raise ValueError('untrusted discovery run')
    source = revision(producer['revision'])
    command('git', 'fetch', '--no-tags', 'origin', source)
    target = revision(command('git', 'rev-parse', 'HEAD'))
    trailer = f'Verified-Discovery-Run: {run_id}'
    paths = ('packages', *VERIFIER_INPUTS)
    is_retry = trailer in command('git', 'show', '-s', '--format=%B', target).splitlines() and same_inputs(source, f'{target}^', paths)
    if not same_inputs(source, target, paths) and not is_retry:
        print('Discovery inputs changed; a fresh scan must qualify the new catalog.')
        return None
    report = json.loads((directory / 'discovery/report.json').read_text())
    names = sorted(set(report['updated'] + report['rules_changed']))
    if any(not re.fullmatch(r'[a-z0-9][a-z0-9+._-]*', name) for name in names):
        raise ValueError('invalid candidate name')
    if not names:
        return None
    command(engine, '--catalog', str(directory / 'discovery/packages'), 'verify-candidate', str(directory / 'bundle'))
    if catalog_digest(engine, directory / 'discovery/packages') != value['catalog_sha256']:
        raise ValueError('candidate metadata differs from verified recipes')
    recipes = [catalog / f'{name}.lua' for name in names]
    for recipe in recipes:
        candidate = directory / 'discovery/packages' / recipe.name
        if any(path.is_symlink() or not path.is_file() for path in [recipe, candidate]):
            raise ValueError('promotion requires existing regular recipe files')
        recipe.write_bytes(candidate.read_bytes())
    if catalog_digest(engine, catalog) != value['catalog_sha256']:
        raise ValueError('candidate report omits recipe changes')
    command('git', 'add', '--', *map(str, recipes))
    if not command('git', 'diff', '--cached', '--name-only'):
        return target if is_retry else None
    if is_retry:
        raise ValueError('promoted recipes changed during retry')
    command('git', 'config', 'user.name', 'github-actions[bot]')
    command('git', 'config', 'user.email', '41898282+github-actions[bot]@users.noreply.github.com')
    command('git', 'commit', '-m', 'chore(packages): advance verified upstream updates', '-m', trailer)
    command('git', 'push', 'origin', 'HEAD:main')
    return revision(command('git', 'rev-parse', 'HEAD'))


def select(engine, catalog, destination, tag=None, allow_qualification=False, should_promote=False, recheck=False):
    approved = revision(command('git', 'rev-parse', 'HEAD'))
    reference = None if recheck else resolve(tag or 'catalog-' + catalog_digest(engine, catalog))
    if reference:
        value = pull(reference, destination)
        if value['engine_revision'] != Path('engine-revision').read_text().strip():
            reference = None
        elif value['producer']['workflow'] == '.github/workflows/discovery.yml':
            promoted = promote(value, destination, engine, catalog) if should_promote else None
            if promoted:
                approved = promoted
            else:
                reference = None
        if reference and value['catalog_sha256'] != catalog_digest(engine, catalog):
            reference = None
    should_qualify = not reference and allow_qualification
    if not reference and not should_qualify:
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write('No admitted candidate matches this publication. Repair missing evidence before requesting qualification.\n')
    for key, value in {'candidate': reference or '', 'revision': approved,
                       'ready': str(bool(reference) or should_qualify).lower(),
                       'qualify': str(should_qualify).lower()}.items():
        output(key, value)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('operation', choices=['select', 'pull', 'seed', 'locate', 'approve'])
    parser.add_argument('--recheck', action='store_true')
    parser.add_argument('--allow-qualification', action='store_true')
    parser.add_argument('--promote', action='store_true')
    parser.add_argument('--reference')
    parser.add_argument('--tag')
    parser.add_argument('--output', type=Path, default=Path('retained'))
    parser.add_argument('--catalog', type=Path, default=Path('packages'))
    parser.add_argument('--engine', default='engine/target/release/rootbeer-forge')
    args = parser.parse_args()
    if args.operation == 'approve':
        value = metadata(args.output)
        if value['engine_revision'] != Path('engine-revision').read_text().strip():
            raise ValueError('candidate uses a different engine pin; qualify current inputs using approved cached results')
        digest = catalog_digest(args.engine, args.catalog)
        if digest != value['catalog_sha256']:
            raise ValueError('approved catalog differs from retained candidate')
        subprocess.run([args.engine, '--catalog', str(args.catalog), 'verify-candidate', str(args.output / 'bundle')], check=True)
        sha = command('git', 'rev-parse', 'HEAD')
        current = command('git', 'ls-remote', 'origin', 'refs/heads/main').split()[0]
        if sha != current:
            raise ValueError('main advanced; a newer publication must select the candidate')
        Path('approval.json').write_text(json.dumps({'schema': 1, 'repository': repository(),
                                                   'catalog_sha256': digest, 'revision': sha}))
        output('digest', pinned(args.reference).split('@')[1])
        return
    if args.operation == 'select':
        select(args.engine, args.catalog, args.output, args.tag, args.allow_qualification, args.promote, args.recheck)
        return
    if args.operation == 'locate':
        verify_provenance(args.reference)
        if not args.tag or not re.fullmatch(r'(?:catalog-[0-9a-f]{64}|collector-[0-9]+-[0-9]+|accepted)', args.tag):
            raise ValueError('invalid result locator')
        if args.tag == 'accepted':
            verify_provenance(args.reference, approved=True)
        subprocess.run(['oras', 'tag', pinned(args.reference), args.tag], check=True)
        return
    if args.operation == 'seed':
        reference = resolve('accepted')
        if reference is None:
            print('No approved durable results; continuing with local cache evidence.')
            return
        with tempfile.TemporaryDirectory() as directory:
            destination = Path(directory) / 'candidate'
            pull(reference, destination, approved=True, engine=args.engine)
            plan = json.loads(command(args.engine, 'candidate-files', str(destination / 'bundle')))
            subprocess.run([args.engine, 'import-results', '--bundle', str(destination / 'bundle'),
                            '--cache', '.package-results', '--system', plan['system']], check=True)
        return
    pull(args.reference, args.output)


if __name__ == '__main__':
    main()
