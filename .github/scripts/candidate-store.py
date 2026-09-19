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


def pull_files(reference, destination):
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
        for layer in layers:
            name = layer['annotations']['org.opencontainers.image.title']
            path = staging / name
            path.parent.mkdir(parents=True, exist_ok=True)
            subprocess.run(['oras', 'blob', 'fetch', '--output', str(path), registry() + '@' + layer['digest']], check=True)
            digest = hashlib.sha256()
            with path.open('rb') as source:
                for chunk in iter(lambda: source.read(1024 * 1024), b''):
                    digest.update(chunk)
            if path.stat().st_size != layer['size'] or 'sha256:' + digest.hexdigest() != layer['digest']:
                raise ValueError('candidate layer digest or size mismatch')
        staging.rename(destination)
    return json.loads((destination / 'candidate.json').read_text())


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


def pull(reference, destination, approved=False):
    verify_provenance(reference)
    attestations = verify_provenance(reference, approved=True) if approved else None
    pull_files(reference, destination)
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


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('operation', choices=['select', 'pull', 'seed', 'locate', 'approve'])
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
        tag = args.tag or 'catalog-' + catalog_digest(args.engine, args.catalog)
        reference = resolve(tag)
        if reference:
            verify_provenance(reference)
        output('candidate', reference or '')
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
            pull(reference, destination, approved=True)
            subprocess.run([args.engine, 'import-results', '--bundle', str(destination / 'bundle'),
                            '--cache', '.package-results'], check=True)
        return
    metadata = pull(args.reference, args.output)
    output('engine_revision', metadata['engine_revision'])
    output('source_run', metadata['producer']['run_id'])
    output('source_workflow', metadata['producer']['workflow'])
    output('catalog_sha256', metadata['catalog_sha256'])


if __name__ == '__main__':
    main()
