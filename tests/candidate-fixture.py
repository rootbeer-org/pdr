import argparse
import hashlib
import importlib.util
import json
import os
from pathlib import Path
import platform
import shutil
import subprocess
import sys
import tarfile

spec = importlib.util.spec_from_file_location('candidate_store', Path(__file__).resolve().parents[1] / '.github/scripts/candidate-store.py')
store = importlib.util.module_from_spec(spec)
spec.loader.exec_module(store)
store.registry = lambda: f'ghcr.io/{store.repository().lower()}/ci-fixture'
CONTEXT = 'durable-candidate-fixture-v1'


def prepare(root, engine):
    root.mkdir()
    source = root / 'source'
    source.mkdir()
    counter = root / 'compilations'
    (source / 'configure').write_text(f'''#!/bin/sh
echo built >> "{counter}"
cat > Makefile <<'MAKE'
all:
\ttrue
check:
\ttrue
install:
\tmkdir -p $(DESTDIR)/bin
\tprintf '#!/bin/sh\\necho fixture\\n' > $(DESTDIR)/bin/tool
\tchmod +x $(DESTDIR)/bin/tool
MAKE
''')
    archive = root / 'source.tar.gz'
    with tarfile.open(archive, 'w:gz') as bundle:
        bundle.add(source, arcname='source')
    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    downloads = root / 'cache/builds/downloads'
    downloads.mkdir(parents=True)
    shutil.copyfile(archive, downloads / f'sha256-{digest}')
    catalog = root / 'packages'
    catalog.mkdir()
    system = ('aarch64' if platform.machine() in ['aarch64', 'arm64'] else 'x86_64') + ('-macos' if sys.platform == 'darwin' else '-linux')
    (catalog / 'fixture.lua').write_text(f'''return {{
      schema = 2, name = "fixture", description = "Durable evidence regression", homepage = "https://example.invalid",
      default_version = "1", systems = {{ "{system}" }},
      inputs = {{ source = {{ url = "https://example.invalid/source.tar.gz", archive = "tar.gz", strip_prefix = "source" }} }},
      build = {{ backend = "autotools" }},
      outputs = {{ bins = {{ "tool" }}, checks = {{ {{ "tool", "--version" }} }} }},
      versions = {{ ["1"] = {{ inputs = {{ source = {{ sha256 = "{digest}" }} }} }} }},
    }}''')
    directory = root / 'candidate'
    directory.mkdir()
    subprocess.run([engine, '--catalog', str(catalog), 'export', '--registry', store.repository().lower(),
                    '--cache', str(root / 'cache'), '--cache-context', CONTEXT, '--jobs', '1',
                    '--output', str(directory / 'bundle')], check=True)
    subprocess.run([engine, '--catalog', str(catalog), 'verify-candidate', str(directory / 'bundle')], check=True)
    value = {'schema': 1, 'repository': store.repository(), 'catalog_sha256': store.catalog_digest(engine, catalog),
             'producer': {'run_id': int(os.environ.get('GITHUB_RUN_ID', '1')), 'attempt': int(os.environ.get('GITHUB_RUN_ATTEMPT', '1')),
                          'revision': store.command('git', 'rev-parse', 'HEAD'),
                          'workflow': '.github/workflows/candidate-fixture.yml', 'event': os.environ.get('GITHUB_EVENT_NAME', 'local')},
             'engine_revision': Path('engine-revision').read_text().strip(),
             'verifier_revision': store.command('git', 'rev-parse', 'HEAD')}
    (directory / 'candidate.json').write_text(json.dumps(value, sort_keys=True))
    shutil.rmtree(root / 'cache')
    shutil.rmtree(source)
    archive.unlink()
    return directory


def consume(root, engine, reference):
    destination = root / 'restored'
    store.pull_files(reference, destination)
    expected = root / 'candidate'
    for path in expected.rglob('*'):
        if path.is_file():
            assert path.read_bytes() == (destination / path.relative_to(expected)).read_bytes(), path
    subprocess.run([engine, '--catalog', str(root / 'packages'), 'verify-candidate', str(destination / 'bundle')], check=True)
    subprocess.run([engine, 'import-results', '--bundle', str(destination / 'bundle'), '--cache', str(root / 'empty-cache')], check=True)
    command = [engine, '--catalog', str(root / 'packages'), 'export', '--registry', store.repository().lower(),
               '--cache', str(root / 'empty-cache'), '--cache-context', CONTEXT, '--jobs', '1']
    subprocess.run([*command, '--plan', '--output', str(root / 'plan.json')], check=True)
    decisions = json.loads((root / 'plan.json').read_text())['packages']
    assert decisions['fixture@1']['action'] == 'reuse', decisions
    subprocess.run([*command, '--output', str(root / 'reused')], check=True)
    assert (root / 'compilations').read_text().splitlines() == ['built']
    assert (root / 'reused/index.json').read_bytes() == (destination / 'bundle/index.json').read_bytes()


def local_transport(root, engine):
    directory = prepare(root, engine)
    original_run = subprocess.run
    layout = str(root / 'layout')
    def arguments(args):
        if args[0] != 'oras':
            return args
        position = 3 if args[1] in ['manifest', 'blob'] else 2
        values = [layout + value[len(store.registry()):] if value.startswith(store.registry()) else value for value in args]
        return [*values[:position], '--oci-layout', *values[position:]]
    def run(args, **kwargs):
        return original_run(arguments(args), **kwargs)
    from unittest.mock import patch
    with patch.object(subprocess, 'run', side_effect=run):
        reference = store.push(directory, 'fixture', '2026-01-01T00:00:00Z')
        consume(root, engine, reference)


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('operation', choices=['prepare', 'retain', 'consume', 'local'])
    parser.add_argument('--root', type=Path, default=Path('fixture'))
    parser.add_argument('--engine', default='engine/target/release/rootbeer-forge')
    parser.add_argument('--reference')
    args = parser.parse_args()
    root = args.root.resolve()
    engine = str(Path(args.engine).resolve())
    if args.operation == 'local':
        local_transport(root, engine)
        return
    if args.operation == 'prepare':
        prepare(root, engine)
        return
    if args.operation == 'retain':
        directory = root / 'candidate'
        reference = store.push(directory, f"run-{os.environ['GITHUB_RUN_ID']}-{os.environ['GITHUB_RUN_ATTEMPT']}", store.command('git', 'show', '-s', '--format=%cI', 'HEAD'))
        store.output('reference', reference)
        store.output('digest', reference.split('@')[1])
        return
    subprocess.run(['gh', 'attestation', 'verify', 'oci://' + args.reference, '--repo', store.repository(),
                    '--signer-workflow', store.repository() + '/.github/workflows/candidate-fixture.yml',
                    '--source-ref', 'refs/heads/refactor/package-ci', '--deny-self-hosted-runners', '--bundle-from-oci'], check=True)
    try:
        store.verify_provenance(args.reference)
    except subprocess.CalledProcessError:
        pass
    else:
        raise AssertionError('production policy accepted a fixture branch signer')
    consume(root, engine, args.reference)
    print('Exact OCI bytes restored; empty cache reused the qualification; production policy rejected the fixture signer.')


if __name__ == '__main__':
    main()
