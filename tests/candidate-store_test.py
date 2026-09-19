import copy
import hashlib
import importlib.util
import io
import json
import os
from pathlib import Path
import subprocess
import tempfile
import unittest
from unittest.mock import patch
import zipfile

spec = importlib.util.spec_from_file_location('retain_results', Path(__file__).resolve().parents[1] / '.github/scripts/retain-results.py')
retain = importlib.util.module_from_spec(spec)
spec.loader.exec_module(retain)
store = retain.store


def candidate_metadata():
    return {'schema': 1, 'repository': 'owner/index', 'catalog_sha256': 'a' * 64,
            'engine_revision': 'b' * 40, 'verifier_revision': 'c' * 40,
            'producer': {'run_id': 12, 'attempt': 1, 'revision': 'd' * 40,
                         'workflow': '.github/workflows/packages.yml', 'event': 'pull_request'}}


class CandidateTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        self.environment = patch.dict(os.environ, GITHUB_REPOSITORY='owner/index')
        self.environment.start()
        self.addCleanup(self.environment.stop)
        self.reference = store.registry() + '@sha256:' + 'a' * 64

    def test_references_require_own_registry_and_exact_digest(self):
        self.assertEqual(self.reference, store.pinned(self.reference))
        for reference in [store.registry() + ':latest', self.reference.replace('owner', 'other'),
                          self.reference + '/extra', self.reference.replace('sha256:', '')]:
            with self.subTest(reference=reference), self.assertRaises(ValueError):
                store.pinned(reference)

    def test_only_missing_manifests_are_cache_misses(self):
        with patch.object(store.subprocess, 'run') as run:
            run.return_value = subprocess.CompletedProcess([], 1, '', 'error: MANIFEST_UNKNOWN')
            self.assertIsNone(store.resolve('accepted'))
            for error in ['unauthorized: authentication required', 'timeout', 'invalid response']:
                run.return_value = subprocess.CompletedProcess([], 1, '', error)
                with self.subTest(error=error), self.assertRaises(RuntimeError):
                    store.resolve('accepted')
            run.return_value = subprocess.CompletedProcess([], 0, 'sha256:' + 'a' * 64, '')
            self.assertEqual(self.reference, store.resolve('accepted'))

    def test_attestation_policy_binds_registry_workflow_main_and_predicate(self):
        with patch.object(store, 'command', return_value='[]') as command:
            store.verify_provenance(self.reference)
            arguments = command.call_args.args
            self.assertIn('owner/index/.github/workflows/retain-results.yml', arguments)
            self.assertIn('refs/heads/main', arguments)
            self.assertIn('--bundle-from-oci', arguments)
            self.assertIn('--deny-self-hosted-runners', arguments)
            store.verify_provenance(self.reference, approved=True)
            arguments = command.call_args.args
            self.assertIn('owner/index/.github/workflows/publish.yml', arguments)
            self.assertIn(store.APPROVAL_TYPE, arguments)

    def test_no_download_when_admission_or_approval_fails(self):
        with patch.object(store, 'verify_provenance', side_effect=RuntimeError('bad signature')), patch.object(store, 'pull_files') as pull:
            with self.assertRaises(RuntimeError):
                store.pull(self.reference, self.root / 'out')
            pull.assert_not_called()
        with patch.object(store, 'verify_provenance', side_effect=[[], RuntimeError('no approval')]), patch.object(store, 'pull_files') as pull:
            with self.assertRaises(RuntimeError):
                store.pull(self.reference, self.root / 'out', approved=True)
            pull.assert_not_called()

    def test_catalog_approval_must_match_the_candidate(self):
        predicate = {'schema': 1, 'repository': 'owner/index', 'catalog_sha256': 'a' * 64, 'revision': 'b' * 40}
        def attest(value):
            return [{'verificationResult': {'statement': {'predicateType': store.APPROVAL_TYPE, 'predicate': value}}}]
        store.verify_approval(attest(predicate), candidate_metadata())
        for field, value in [('schema', 2), ('repository', 'other/index'), ('catalog_sha256', 'b' * 64), ('revision', 'main')]:
            with self.subTest(field=field), self.assertRaises(ValueError):
                store.verify_approval(attest(dict(predicate, **{field: value})), candidate_metadata())

    def manifest(self, files):
        self.blobs = {}
        layers = []
        for name, data in files.items():
            digest = 'sha256:' + hashlib.sha256(data).hexdigest()
            self.blobs[digest] = data
            layers.append({'digest': digest, 'size': len(data), 'annotations': {'org.opencontainers.image.title': name}})
        return {'artifactType': store.ARTIFACT_TYPE, 'layers': layers}

    def pull_manifest(self, manifest, corrupt=False, engine=None):
        data = json.dumps(manifest).encode()
        reference = store.registry() + '@sha256:' + hashlib.sha256(data).hexdigest()
        def fetch(args, **kwargs):
            path = Path(args[args.index('--output') + 1])
            path.write_bytes(b'corrupt' if corrupt else self.blobs[args[-1].split('@')[1]])
        with patch.object(store.subprocess, 'check_output', return_value=data), patch.object(store.subprocess, 'run', side_effect=fetch):
            return store.pull_files(reference, self.root / 'out', engine=engine)

    def test_raw_oci_layers_round_trip_without_unpacking_package_archives(self):
        files = {'candidate.json': json.dumps(candidate_metadata()).encode(), 'bundle/index.json': b'{}',
                 'bundle/artifacts/' + 'e' * 64 + '.tar.gz': b'opaque archive contents'}
        self.assertEqual(candidate_metadata(), self.pull_manifest(self.manifest(files)))
        for name, data in files.items():
            self.assertEqual(data, (self.root / 'out' / name).read_bytes())

    def test_platform_transfer_downloads_only_forge_selected_content_and_all_metadata(self):
        selected = 'bundle/artifacts/' + 'a' * 64 + '.tar.gz'
        unselected = 'bundle/artifacts/' + 'b' * 64 + '.tar.gz'
        qualification = 'bundle/qualifications/' + 'c' * 64 + '.json'
        receipt = 'bundle/receipts/' + 'd' * 64 + '.json'
        files = {'candidate.json': json.dumps(candidate_metadata()).encode(), 'bundle/index.json': b'{}',
                 qualification: b'qualification', selected: b'current platform archive',
                 unselected: b'foreign platform archive', receipt: b'current receipt', 'discovery/report.json': b'{}'}
        plan = {'schema': 1, 'system': 'aarch64-macos', 'files': [selected.removeprefix('bundle/'), receipt.removeprefix('bundle/')]}
        with patch.object(store, 'command', return_value=json.dumps(plan)) as command:
            self.pull_manifest(self.manifest(files), engine='trusted-forge')
        self.assertEqual(('trusted-forge', 'candidate-files'), command.call_args.args[:2])
        actual = {path.relative_to(self.root / 'out').as_posix() for path in (self.root / 'out').rglob('*') if path.is_file()}
        self.assertEqual({'candidate.json', 'bundle/index.json', qualification, selected, receipt}, actual)

    def test_missing_platform_layers_fail_without_exposing_a_partial_candidate(self):
        manifest = self.manifest({'candidate.json': b'{}', 'bundle/index.json': b'{}'})
        for name in ['artifacts/' + 'a' * 64 + '.tar.gz', '../escape']:
            plan = {'schema': 1, 'system': 'x86_64-linux', 'files': [name]}
            with self.subTest(name=name), patch.object(store, 'command', return_value=json.dumps(plan)), self.assertRaises(ValueError):
                self.pull_manifest(manifest, engine='trusted-forge')
            self.assertFalse((self.root / 'out').exists())

    def test_unsafe_duplicate_and_corrupt_layers_fail_before_destination_is_visible(self):
        files = {'candidate.json': b'{}', 'bundle/index.json': b'{}'}
        manifest = self.manifest(files)
        invalid = []
        for name in ['../escape', '/absolute', 'bundle/../escape', 'bundle/artifacts/readme', 'bundle/qualifications/evil.json']:
            value = copy.deepcopy(manifest)
            value['layers'][0]['annotations']['org.opencontainers.image.title'] = name
            invalid.append(value)
        value = copy.deepcopy(manifest)
        value['layers'].append(value['layers'][0])
        invalid.append(value)
        invalid.append(dict(manifest, artifactType='application/other'))
        for value in invalid:
            with self.subTest(manifest=value), self.assertRaises(ValueError):
                self.pull_manifest(value)
            self.assertFalse((self.root / 'out').exists())
        with self.assertRaises(ValueError):
            self.pull_manifest(manifest, corrupt=True)
        self.assertFalse((self.root / 'out').exists())
        with patch.object(store.subprocess, 'check_output', return_value=b'{}'), self.assertRaises(ValueError):
            store.pull_files(self.reference, self.root / 'out')

    def test_metadata_rejects_other_repository_and_unknown_workflow(self):
        for value in [dict(candidate_metadata(), schema=2), dict(candidate_metadata(), repository='other/index'),
                      dict(candidate_metadata(), producer={'workflow': '.github/workflows/evil.yml'})]:
            (self.root / 'candidate.json').write_text(json.dumps(value))
            with self.assertRaises(ValueError):
                store.metadata(self.root)

    def download(self, name, is_symlink=False, corrupt=False):
        archive = io.BytesIO()
        with zipfile.ZipFile(archive, 'w') as bundle:
            member = zipfile.ZipInfo(name)
            member.external_attr = (0o120777 if is_symlink else 0o100644) << 16
            bundle.writestr(member, b'contents')
        data = archive.getvalue()
        artifact = {'id': 12, 'expired': False, 'digest': 'sha256:' + hashlib.sha256(data).hexdigest()}
        def fetch(*args, **kwargs):
            kwargs['stdout'].write(b'corrupt' if corrupt else data)
        with patch.object(retain.subprocess, 'run', side_effect=fetch):
            retain.download('owner/index', artifact, self.root, 'bundle')

    def test_actions_zip_digest_and_paths_are_checked_before_extracting(self):
        for name, symlink, corrupt in [('../escape', False, False), ('index.json', True, False),
                                      ('/absolute', False, False), ('index.json', False, True)]:
            with self.subTest(name=name, symlink=symlink), self.assertRaises(ValueError):
                self.download(name, symlink, corrupt)
            self.assertFalse((self.root / 'bundle').exists())
        self.download('index.json')
        self.assertEqual(b'contents', (self.root / 'bundle/index.json').read_bytes())


class PublicationDecisionTests(unittest.TestCase):
    def test_only_explicit_qualification_can_replace_missing_or_stale_evidence(self):
        cases = [
            ({}, ('true', 'false')),
            ({'reference': None}, ('false', 'false')),
            ({'reference': None, 'allow_qualification': True}, ('true', 'true')),
            ({'engine': 'old'}, ('false', 'false')),
            ({'catalog': 'unmerged'}, ('false', 'false')),
            ({'engine': 'old', 'allow_qualification': True}, ('true', 'true')),
            ({'discovery': True}, ('false', 'false')),
            ({'discovery': True, 'should_promote': True}, ('true', 'false')),
            ({'recheck': True, 'allow_qualification': True}, ('true', 'true')),
        ]
        for overrides, expected in cases:
            with self.subTest(overrides=overrides), tempfile.TemporaryDirectory() as directory:
                root = Path(directory)
                value = candidate_metadata()
                value['engine_revision'] = overrides.get('engine', 'b' * 40)
                value['catalog_sha256'] = overrides.get('catalog', 'a' * 64)
                if overrides.get('discovery'):
                    value['producer']['workflow'] = '.github/workflows/discovery.yml'
                outputs = {}
                with patch.object(store, 'command', return_value='c' * 40), \
                     patch.object(store, 'resolve', return_value=overrides.get('reference', 'immutable')) as resolve, \
                     patch.object(store, 'pull', return_value=value) as pull, \
                     patch.object(store, 'promote', return_value='d' * 40) as promote, \
                     patch.object(store, 'catalog_digest', return_value='a' * 64), \
                     patch.object(store.Path, 'read_text', return_value='b' * 40), \
                     patch.object(store, 'output', side_effect=lambda key, value: outputs.update({key: value})), \
                     patch.dict(os.environ, GITHUB_STEP_SUMMARY=str(root / 'summary')):
                    store.select('forge', root / 'packages', root / 'retained',
                                 allow_qualification=overrides.get('allow_qualification', False),
                                 should_promote=overrides.get('should_promote', False),
                                 recheck=overrides.get('recheck', False))
                self.assertEqual(expected, (outputs['ready'], outputs['qualify']))
                if overrides.get('recheck'):
                    resolve.assert_not_called()
                    pull.assert_not_called()
                if outputs['qualify'] == 'true':
                    self.assertEqual('', outputs['candidate'])
                if overrides.get('engine') == 'old' or not overrides.get('should_promote'):
                    promote.assert_not_called()


class PromotionTests(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory()
        self.addCleanup(self.directory.cleanup)
        self.root = Path(self.directory.name)
        previous = Path.cwd()
        os.chdir(self.root)
        self.addCleanup(os.chdir, previous)
        self.environment = patch.dict(os.environ, GITHUB_REPOSITORY='owner/index', GITHUB_REF='refs/heads/main')
        self.environment.start()
        self.addCleanup(self.environment.stop)
        self.command = store.command
        self.command('git', 'init', '-q')
        for key, value in [('user.name', 'Test'), ('user.email', 'test@example.com'), ('commit.gpgsign', 'false')]:
            self.command('git', 'config', key, value)
        self.paths = ['packages/tool.lua', 'engine-revision', '.github/workflows/discovery.yml',
                      '.github/actions/setup/action.yml', '.github/scripts/candidate-store.py']
        for name in self.paths:
            path = Path(name)
            path.parent.mkdir(parents=True, exist_ok=True)
            path.write_text('original')
        self.command('git', 'add', '.')
        self.command('git', 'commit', '-qm', 'initial')
        self.source = self.command('git', 'rev-parse', 'HEAD')
        self.retained = self.root / 'retained'
        (self.retained / 'discovery/packages').mkdir(parents=True)
        (self.retained / 'discovery/packages/tool.lua').write_text('updated')
        (self.retained / 'discovery/report.json').write_text(json.dumps({'updated': [], 'rules_changed': ['tool']}))
        self.value = candidate_metadata()
        self.value['producer'].update(revision=self.source, workflow='.github/workflows/discovery.yml')
        self.value['catalog_sha256'] = self.digest('forge', self.retained / 'discovery/packages')
        self.run = {'path': '.github/workflows/discovery.yml', 'head_repository': {'full_name': 'owner/index'},
                    'head_sha': self.source, 'head_branch': 'main', 'event': 'schedule',
                    'status': 'completed', 'conclusion': 'success'}
        self.pushed = []

    def digest(self, engine, catalog):
        return hashlib.sha256(b''.join(path.read_bytes() for path in sorted(catalog.glob('*.lua')))).hexdigest()

    def execute(self, *args):
        if args[:2] == ('gh', 'api'):
            return json.dumps(self.run)
        if args[:2] == ('git', 'fetch') or args[0] == 'forge':
            return ''
        if args[:2] == ('git', 'push'):
            self.pushed.append(args)
            return ''
        return self.command(*args)

    def promote(self):
        with patch.object(store, 'command', side_effect=self.execute), patch.object(store, 'catalog_digest', side_effect=self.digest):
            return store.promote(self.value, self.retained, 'forge', Path('packages'))

    def test_rules_only_promotion_is_idempotent_on_retry(self):
        promoted = self.promote()
        self.assertNotEqual(self.source, promoted)
        self.assertEqual('updated', Path('packages/tool.lua').read_text())
        self.assertEqual(promoted, self.promote())
        self.assertEqual(1, len(self.pushed))

    def test_wrong_producer_or_unfinished_discovery_cannot_promote(self):
        for field, value in [('path', '.github/workflows/packages.yml'), ('head_branch', 'feature'),
                             ('event', 'pull_request'), ('status', 'in_progress'), ('conclusion', 'failure'),
                             ('head_sha', 'e' * 40), ('head_repository', {'full_name': 'other/index'})]:
            previous = self.run[field]
            self.run[field] = value
            with self.subTest(field=field), self.assertRaises(ValueError):
                self.promote()
            self.run[field] = previous
        self.assertEqual('original', Path('packages/tool.lua').read_text())
        self.assertEqual([], self.pushed)

    def test_changed_catalog_or_verifier_prevents_promotion_but_docs_do_not(self):
        Path('README.md').write_text('docs')
        self.command('git', 'add', 'README.md')
        self.command('git', 'commit', '-qm', 'docs')
        self.assertTrue(store.same_inputs(self.source, 'HEAD', ('packages', *store.VERIFIER_INPUTS)))
        for name in self.paths:
            Path(name).write_text('changed')
            self.command('git', 'add', name)
            self.command('git', 'commit', '-qm', 'changed input')
            with self.subTest(name=name):
                self.assertIsNone(self.promote())
            self.command('git', 'restore', '--source', self.source, '--staged', '--worktree', name)
            self.command('git', 'commit', '-qm', 'restore input')
        self.assertEqual([], self.pushed)

    def test_invalid_names_symlinks_and_omitted_changes_cannot_push(self):
        report = self.retained / 'discovery/report.json'
        report.write_text(json.dumps({'updated': ['../escape'], 'rules_changed': []}))
        with self.assertRaises(ValueError):
            self.promote()
        report.write_text(json.dumps({'updated': ['tool'], 'rules_changed': []}))
        recipe = self.retained / 'discovery/packages/tool.lua'
        recipe.unlink()
        recipe.symlink_to(self.root / 'packages/tool.lua')
        with self.assertRaises(ValueError):
            self.promote()
        recipe.unlink()
        recipe.write_text('updated')
        (self.retained / 'discovery/packages/omitted.lua').write_text('unreported')
        self.value['catalog_sha256'] = self.digest('forge', self.retained / 'discovery/packages')
        with self.assertRaises(ValueError):
            self.promote()
        self.assertEqual([], self.pushed)


class AdmissionTests(unittest.TestCase):
    def setUp(self):
        self.run = {'id': 12, 'path': '.github/workflows/packages.yml', 'head_repository': {'full_name': 'owner/index'},
                    'head_sha': 'a' * 40, 'head_branch': 'feature', 'status': 'completed', 'event': 'pull_request'}
        self.pull = {'head': {'sha': 'a' * 40, 'repo': {'full_name': 'owner/index'}}, 'base': {'sha': 'b' * 40, 'ref': 'main'}}

    def admit(self, run=None, pulls=None, jobs=None):
        with patch.object(retain, 'fetch'), patch.object(retain, 'same_verifier'), patch.object(retain, 'api', return_value=[self.pull] if pulls is None else pulls), patch.object(retain, 'pages', return_value=[{'name': 'qualify / assemble', 'conclusion': 'success'}] if jobs is None else jobs), patch.object(store, 'command', return_value='b' * 40):
            return retain.admit(run or self.run, 'owner/index', 'c' * 40)

    def test_same_repository_pr_and_main_discovery_are_admitted(self):
        self.assertEqual('a' * 40, self.admit())
        self.assertEqual('a' * 40, self.admit(dict(self.run, event='schedule', head_branch='main', path='.github/workflows/discovery.yml')))

    def test_forks_wrong_workflows_events_and_failed_assembly_are_rejected(self):
        for overrides in [{'head_repository': {'full_name': 'fork/index'}}, {'path': '.github/workflows/evil.yml'},
                          {'event': 'pull_request_target'}, {'event': 'push'}, {'status': 'queued'}]:
            with self.subTest(overrides=overrides), self.assertRaises(ValueError):
                self.admit(dict(self.run, **overrides))
        for pulls in [[], [dict(self.pull, head={'sha': 'a' * 40, 'repo': {'full_name': 'fork/index'}})]]:
            with self.assertRaises(ValueError):
                self.admit(pulls=pulls)
        for jobs in [[], [{'name': 'assemble', 'conclusion': 'failure'}], [{'name': 'build', 'conclusion': 'success'}]]:
            with self.assertRaises(ValueError):
                self.admit(jobs=jobs)

    def test_any_verifier_tree_change_prevents_admission(self):
        for path in ['engine-revision', '.github/workflows', '.github/actions', '.github/scripts']:
            def tree(*args):
                return 'different' if args[-1] == f'source:{path}' else 'same'
            with self.subTest(path=path), patch.object(store, 'command', side_effect=tree), self.assertRaises(ValueError):
                retain.same_verifier('source', 'trusted')
        with patch.object(store, 'command', return_value='same'):
            retain.same_verifier('source', 'trusted')


if __name__ == '__main__':
    unittest.main()
