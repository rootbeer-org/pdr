import hashlib
import importlib.util
import io
import json
import os
import subprocess
from pathlib import Path
import shutil
import tarfile
import tempfile
import unittest
from unittest.mock import patch
import zipfile

spec = importlib.util.spec_from_file_location('package_results', Path(__file__).resolve().parents[1] / '.github/scripts/package-results.py')
results = importlib.util.module_from_spec(spec)
spec.loader.exec_module(results)


class CheckpointTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.cache = self.root / 'cache'
        self.archive = self.root / 'package-results.tar'
        self.expected = {
            'schema': 1, 'repository': 'owner/index', 'run_id': 12,
            'source_revision': 'a' * 40, 'runner': 'ubuntu-24.04',
            'environment': 'b' * 64, 'engine_revision': 'c' * 40, 'recheck': False,
        }
        self.files = {
            f"{'d' * 64}/record.json": b'qualification record',
            f"{'d' * 64}/receipts/{'e' * 64}.json": b'original receipt',
            f"{'d' * 64}/artifacts/{'f' * 64}.tar.gz": b'archive bytes',
            f"builds/results/{'a' * 64}/receipt.json": b'build receipt',
            f"builds/results/{'a' * 64}/package.tar.gz": b'build archive',
        }
        for name, data in self.files.items():
            path = self.cache / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_bytes(data)

    def save(self):
        self.assertTrue(results.checkpoint(self.cache, self.archive, self.expected))

    def add_member(self, name, kind=tarfile.REGTYPE):
        with tarfile.open(self.archive, 'a') as bundle:
            info = tarfile.TarInfo(name)
            info.type = kind
            info.linkname = '../escape'
            bundle.addfile(info, io.BytesIO())

    def test_failed_job_checkpoint_restores_receipts_and_archives_without_build_store(self):
        for name in ['builds/store/secret', 'builds/downloads/source', 'builds/locks/lock']:
            path = self.cache / name
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('excluded')
        self.save()
        shutil.rmtree(self.cache)
        self.assertEqual(2, results.restore_archive(self.archive, self.cache, self.expected))
        self.assertFalse((self.cache / 'builds/store').exists())
        for name, data in self.files.items():
            self.assertEqual(data, (self.cache / name).read_bytes())
        self.assertEqual(2, results.restore_archive(self.archive, self.cache, self.expected))

    def test_recheck_retry_discards_baseline_results_but_preserves_completed_attempt(self):
        completed = self.cache / ('d' * 64)
        baseline = self.cache / ('0' * 64)
        shutil.copytree(completed, baseline)
        downloads = self.cache / 'builds/downloads/source'
        downloads.parent.mkdir(parents=True)
        downloads.write_text('source download')
        results.discard_previous_results(self.cache)
        self.assertFalse(completed.exists())
        self.assertFalse(baseline.exists())
        self.assertFalse((self.cache / 'builds/results').exists())
        self.assertTrue(downloads.exists())
        completed.mkdir()
        (completed / 'record.json').write_text('completed during this recheck')
        self.expected['recheck'] = True
        self.save()
        shutil.copytree(completed, baseline)
        results.discard_previous_results(self.cache)
        self.assertEqual(1, results.restore_archive(self.archive, self.cache, self.expected))
        self.assertEqual('completed during this recheck', (completed / 'record.json').read_text())
        self.assertFalse(baseline.exists())

    @unittest.skipUnless(os.environ.get('ROOTBEER_FORGE'), 'set ROOTBEER_FORGE for export retry regression')
    def test_real_export_retry_reuses_successful_qualification_after_losing_the_cache(self):
        shutil.rmtree(self.cache)
        engine = str(Path(os.environ['ROOTBEER_FORGE']).resolve())
        source = self.root / 'source'
        source.mkdir()
        counter = self.root / 'compilations'
        transient = self.root / 'transient-failure'
        transient.touch()
        configure = f'''#!/bin/sh
echo built >> "{counter}"
cat > Makefile <<'MAKE'
all:
\ttrue
check:
\ttrue
install:
\tmkdir -p $(DESTDIR)/bin
\tprintf '#!/bin/sh\\n[ "$$1" != "--transient" ] || [ ! -f "{transient}" ]\\n' > $(DESTDIR)/bin/tool
\tchmod +x $(DESTDIR)/bin/tool
MAKE
'''
        (source / 'configure').write_text(configure)
        archive = self.root / 'source.tar.gz'
        with tarfile.open(archive, 'w:gz') as bundle:
            bundle.add(source, arcname='source')
        digest = hashlib.sha256(archive.read_bytes()).hexdigest()
        downloads = self.cache / 'builds/downloads'
        downloads.mkdir(parents=True)
        shutil.copyfile(archive, downloads / f'sha256-{digest}')
        packages = self.root / 'packages'
        packages.mkdir()
        for name, check in [('good', '--version'), ('retry', '--transient')]:
            (packages / f'{name}.lua').write_text(f'''return {{
                schema = 2, name = "{name}", description = "Checkpoint regression", homepage = "https://example.invalid",
                default_version = "1", systems = {{ "aarch64-macos", "aarch64-linux", "x86_64-linux" }},
                inputs = {{ source = {{ url = "https://example.invalid/source.tar.gz", archive = "tar.gz", strip_prefix = "source" }} }},
                build = {{ backend = "autotools" }},
                outputs = {{ bins = {{ "tool" }}, checks = {{ {{ "tool", "{check}" }} }} }},
                versions = {{ ["1"] = {{ inputs = {{ source = {{ sha256 = "{digest}" }} }} }} }},
            }}''')
        command = [engine, '--catalog', str(packages), 'export', '--registry', 'owner/index',
                   '--cache', str(self.cache), '--cache-context', self.expected['environment'], '--jobs', '1']
        failed = subprocess.run([*command, '--recheck', '--output', str(self.root / 'failed')], capture_output=True, text=True)
        self.assertNotEqual(0, failed.returncode)
        self.assertIn('retry@1', failed.stderr)
        self.assertEqual(2, len(counter.read_text().splitlines()))
        self.expected['recheck'] = True
        self.save()
        shutil.rmtree(self.cache)
        transient.unlink()
        results.restore_archive(self.archive, self.cache, self.expected)
        downloads.mkdir(parents=True)
        shutil.copyfile(archive, downloads / f'sha256-{digest}')
        plan = self.root / 'plan.json'
        subprocess.run([*command, '--plan', '--output', str(plan)], check=True, capture_output=True)
        decisions = json.loads(plan.read_text())['packages']
        self.assertEqual('reuse', decisions['good@1']['action'])
        self.assertEqual('qualify', decisions['retry@1']['action'])
        subprocess.run([*command, '--output', str(self.root / 'success')], check=True, capture_output=True)
        self.assertEqual(3, len(counter.read_text().splitlines()))
        index = json.loads((self.root / 'success/index.json').read_text())
        artifact = next(iter(index['artifacts']['good@1'].values()))
        self.assertEqual(decisions['good@1']['receipt_sha256'], artifact['receipt_sha256'])

    def test_newer_checkpoint_replaces_an_entry_as_a_whole(self):
        self.save()
        obsolete = self.cache / ('d' * 64) / 'receipts' / ('0' * 64 + '.json')
        obsolete.write_text('previous entry')
        results.restore_archive(self.archive, self.cache, self.expected)
        self.assertFalse(obsolete.exists())

    def test_wrong_producer_is_rejected_before_mutation_and_new_environment_is_unused(self):
        self.save()
        for field, value in [('run_id', 13), ('source_revision', 'b' * 40),
                             ('repository', 'other/index'), ('runner', 'macos-15'),
                             ('engine_revision', 'd' * 40), ('schema', 2), ('recheck', True)]:
            with self.subTest(field=field), self.assertRaises(ValueError):
                results.restore_archive(self.archive, self.cache, dict(self.expected, **{field: value}))
        self.assertEqual(0, results.restore_archive(self.archive, self.cache,
                                                   dict(self.expected, environment='f' * 64)))
        for name, data in self.files.items():
            self.assertEqual(data, (self.cache / name).read_bytes())

    def test_traversal_links_duplicate_members_and_missing_metadata_fail_before_mutation(self):
        for name, kind in [('../escape', tarfile.REGTYPE), ('/absolute', tarfile.REGTYPE),
                           ('checkpoint.json', tarfile.REGTYPE),
                           (f"{'d' * 64}/record.json", tarfile.SYMTYPE),
                           (f"{'d' * 64}/record.json", tarfile.LNKTYPE)]:
            self.save()
            self.add_member(name, kind)
            with self.subTest(name=name, kind=kind), self.assertRaises(ValueError):
                results.restore_archive(self.archive, self.cache, self.expected)
        with tarfile.open(self.archive, 'w'):
            pass
        with self.assertRaises(ValueError):
            results.restore_archive(self.archive, self.cache, self.expected)
        self.assertFalse((self.root / 'escape').exists())

    def test_cache_symlinks_are_rejected_on_save_and_restore(self):
        self.save()
        record = self.cache / ('d' * 64) / 'record.json'
        record.unlink()
        record.symlink_to(self.archive)
        with self.assertRaises(ValueError):
            results.checkpoint(self.cache, self.archive, self.expected)
        shutil.rmtree(self.cache)
        self.cache.symlink_to(self.root, target_is_directory=True)
        with self.assertRaises(ValueError):
            results.restore_archive(self.archive, self.cache, self.expected)

    def test_empty_cache_has_no_checkpoint(self):
        self.assertFalse(results.checkpoint(self.root / 'missing', self.archive, self.expected))
        self.assertFalse(self.archive.exists())

    def test_selects_latest_unexpired_earlier_attempt_for_exact_runner(self):
        artifacts = [
            {'name': name, 'expired': expired, 'id': number}
            for number, name, expired in [
                (1, 'package-results-ubuntu-24.04-1', False),
                (2, 'package-results-ubuntu-24.04-2', False),
                (3, 'package-results-ubuntu-24.04-3', True),
                (4, 'package-results-macos-15-3', False),
                (5, 'package-results-ubuntu-24.04-4', False),
            ]
        ]
        with patch.object(results, 'api', return_value={'artifacts': artifacts}):
            self.assertEqual(2, results.previous_checkpoint('owner/index', 12, 'ubuntu-24.04', 4)['id'])
            self.assertIsNone(results.previous_checkpoint('owner/index', 12, 'ubuntu-24.04', 1))
        artifacts.append(artifacts[1])
        with patch.object(results, 'api', return_value={'artifacts': artifacts}), self.assertRaises(ValueError):
            results.previous_checkpoint('owner/index', 12, 'ubuntu-24.04', 4)

    def test_paginates_artifacts(self):
        page = [{'name': 'unrelated', 'expired': False}] * 100
        artifact = {'name': 'package-results-ubuntu-24.04-1', 'expired': False, 'id': 1}
        with patch.object(results, 'api', side_effect=[{'artifacts': page}, {'artifacts': [artifact]}]) as api:
            self.assertEqual(artifact, results.previous_checkpoint('owner/index', 12, 'ubuntu-24.04', 2))
            self.assertTrue(api.call_args.args[0].endswith('page=2'))

    def test_download_checks_authenticated_digest_before_restoring(self):
        self.save()
        zipped = self.root / 'checkpoint.zip'
        with zipfile.ZipFile(zipped, 'w') as bundle:
            bundle.write(self.archive, 'package-results.tar')
        data = zipped.read_bytes()
        artifact = {'id': 99, 'name': 'package-results-ubuntu-24.04-1',
                    'digest': 'sha256:' + hashlib.sha256(data).hexdigest()}

        def download(args, stdout, check):
            self.assertIn('repos/owner/index/actions/artifacts/99/zip', args)
            stdout.write(data)

        shutil.rmtree(self.cache)
        with patch.object(results, 'previous_checkpoint', return_value=artifact), patch.object(results.subprocess, 'run', side_effect=download):
            results.restore(self.cache, self.expected, 2)
            self.assertTrue((self.cache / ('d' * 64) / 'record.json').exists())
            shutil.rmtree(self.cache)
            artifact['digest'] = 'sha256:' + '0' * 64
            with self.assertRaisesRegex(ValueError, 'digest mismatch'):
                results.restore(self.cache, self.expected, 2)
            self.assertFalse(self.cache.exists())


if __name__ == '__main__':
    unittest.main()
