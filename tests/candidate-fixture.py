import argparse
import gzip
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


def current_system():
    return ('aarch64' if platform.machine() in ['aarch64', 'arm64'] else 'x86_64') + ('-macos' if sys.platform == 'darwin' else '-linux')


def prepare(root, engine, systems=None):
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
\tprintf '#!/bin/sh\\necho fixture-%s\\n' "$$(uname -m)" > $(DESTDIR)/bin/tool
\tchmod +x $(DESTDIR)/bin/tool
MAKE
''')
    archive = root / 'source.tar.gz'
    def normalize(member):
        member.mtime = 0
        member.uid = member.gid = 0
        member.uname = member.gname = ''
        member.mode = 0o755 if member.isdir() else 0o644
        return member
    with archive.open('wb') as output, gzip.GzipFile(filename='', fileobj=output, mode='wb', mtime=0) as compressed:
        with tarfile.open(fileobj=compressed, mode='w') as bundle:
            bundle.add(source, arcname='source', filter=normalize)
    digest = hashlib.sha256(archive.read_bytes()).hexdigest()
    downloads = root / 'cache/builds/downloads'
    downloads.mkdir(parents=True)
    shutil.copyfile(archive, downloads / f'sha256-{digest}')
    catalog = root / 'packages'
    catalog.mkdir()
    system_list = ', '.join(json.dumps(system) for system in (systems or [current_system()]))
    (catalog / 'fixture.lua').write_text(f'''return {{
      schema = 2, name = "fixture", description = "Durable evidence regression", homepage = "https://example.invalid",
      default_version = "1", systems = {{ {system_list} }},
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
    subprocess.run([engine, 'verify-index', str(directory / 'bundle/index.json')], check=True)
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


def combine(root, engine, inputs):
    bundles = sorted(inputs.glob('retention-fixture-*'))
    chosen = next(path for path in bundles if current_system() in json.loads((path / 'candidate/bundle/index.json').read_text())['artifacts']['fixture@1'])
    root.mkdir()
    shutil.copytree(chosen / 'packages', root / 'packages')
    shutil.copyfile(chosen / 'compilations', root / 'compilations')
    (root / 'candidate').mkdir()
    shutil.copyfile(chosen / 'candidate/candidate.json', root / 'candidate/candidate.json')
    subprocess.run([engine, 'assemble', '--inputs', str(inputs), '--output', str(root / 'candidate/bundle')], check=True)
    subprocess.run([engine, '--catalog', str(root / 'packages'), 'verify-candidate', str(root / 'candidate/bundle')], check=True)


def consume(root, engine, reference):
    destination = root / 'restored'
    store.pull_files(reference, destination, engine=engine)
    plan = json.loads(store.command(engine, 'candidate-files', str(destination / 'bundle')))
    expected = root / 'candidate'
    metadata = {path.relative_to(expected).as_posix() for path in expected.rglob('*') if path.is_file()
                and (path.name in ['candidate.json', 'index.json'] or path.parent.name == 'qualifications')}
    selected = metadata | {'bundle/' + name for name in plan['files']}
    actual = {path.relative_to(destination).as_posix() for path in destination.rglob('*') if path.is_file()}
    assert actual == selected, (actual, selected)
    for name in selected:
        assert (expected / name).read_bytes() == (destination / name).read_bytes(), name
    original = json.loads((expected / 'bundle/index.json').read_text())
    if len(original['artifacts']['fixture@1']) > 1:
        assert len(actual) < len([path for path in expected.rglob('*') if path.is_file()])
        complete = subprocess.run([engine, '--catalog', str(root / 'packages'), 'verify-candidate', str(destination / 'bundle')], capture_output=True)
        assert complete.returncode != 0, 'partial platform transfer must not satisfy complete publication'
    subprocess.run([engine, 'import-results', '--bundle', str(destination / 'bundle'), '--cache', str(root / 'empty-cache'),
                    '--system', plan['system']], check=True)
    command = [engine, '--catalog', str(root / 'packages'), 'export', '--registry', store.repository().lower(),
               '--cache', str(root / 'empty-cache'), '--cache-context', CONTEXT, '--jobs', '1']
    subprocess.run([*command, '--plan', '--output', str(root / 'plan.json')], check=True)
    decisions = json.loads((root / 'plan.json').read_text())['packages']
    assert decisions['fixture@1']['action'] == 'reuse', decisions
    subprocess.run([*command, '--output', str(root / 'reused')], check=True)
    assert (root / 'compilations').read_text().splitlines() == ['built']
    reused = json.loads((root / 'reused/index.json').read_text())
    assert reused['artifacts']['fixture@1'][plan['system']] == original['artifacts']['fixture@1'][plan['system']]
    print(f"Transferred {len(selected)} of {len([path for path in expected.rglob('*') if path.is_file()])} files; exact {plan['system']} artifacts reused.")


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
    parser.add_argument('operation', choices=['prepare', 'combine', 'retain', 'consume', 'local'])
    parser.add_argument('--root', type=Path, default=Path('fixture'))
    parser.add_argument('--engine', default='engine/target/release/rootbeer-forge')
    parser.add_argument('--reference')
    parser.add_argument('--systems', nargs='+')
    parser.add_argument('--inputs', type=Path, default=Path('fixture-inputs'))
    args = parser.parse_args()
    root = args.root.resolve()
    engine = str(Path(args.engine).resolve())
    if args.operation == 'local':
        local_transport(root, engine)
        return
    if args.operation == 'combine':
        combine(root, engine, args.inputs.resolve())
        return
    if args.operation == 'prepare':
        prepare(root, engine, args.systems)
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
