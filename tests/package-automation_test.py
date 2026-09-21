import copy
import importlib.util
import json
import os
from pathlib import Path
import tempfile
import unittest
from unittest.mock import patch


def module(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).resolve().parents[1] / '.github/scripts' / f'{name}.py')
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


selection = module('package-selection')
jobs = module('package-jobs')
producer = module('package-producer')


class SelectionTests(unittest.TestCase):
    def test_metadata_does_not_rebuild_and_dependencies_propagate(self):
        before = {'lib': {'description': 'old', 'versions': {'1': {'revision': 1}}},
                  'tool': {'versions': {'2': {'build': {'dependencies': ['lib@1']}}}},
                  'app': {'versions': {'3': {'build': {'dependencies': [{'package': 'tool@2', 'kind': 'build'}]}}}}}
        after = copy.deepcopy(before)
        after['lib']['description'] = 'new'
        self.assertEqual(selection.changed_requests(before, after), [])
        after['lib']['versions']['1']['revision'] = 2
        self.assertEqual(selection.changed_requests(before, after), ['app@3', 'lib@1', 'tool@2'])


class RegistryTests(unittest.TestCase):
    def test_denied_is_missing_only_for_an_unpublished_name(self):
        error = 'Error response from registry: denied: requested access to the resource is denied'
        with patch.object(jobs, 'has_published_namespace', side_effect=lambda name: name == 'existing'):
            self.assertTrue(jobs.is_missing('registry/new:tag', 'new', error))
            self.assertFalse(jobs.is_missing('registry/existing:tag', 'existing', error))

    def test_catalog_entry_without_records_is_still_unpublished(self):
        jobs.has_published_namespace.cache_clear()
        with patch.dict(os.environ, {'PACKAGE_REGISTRY': 'tale/rootbeer-index'}), patch.object(jobs, 'approved_discovery', return_value=('revision', {'catalog': {'packages': {'new': {}}}, 'records': {}})):
            self.assertFalse(jobs.has_published_namespace('new'))
        jobs.has_published_namespace.cache_clear()

    def test_upstream_archive_does_not_establish_a_ghcr_namespace(self):
        jobs.has_published_namespace.cache_clear()
        manifest = {'records': {'tool@1': {'system': {'sha256': 'a' * 64}}}}
        record = {'record': {'artifact': {'package': {'source': {'Url': {'url': 'https://upstream.example/tool.zip'}}}}}}
        with patch.dict(os.environ, {'PACKAGE_REGISTRY': 'tale/rootbeer-index'}), patch.object(jobs, 'approved_discovery', return_value=('revision', manifest)), patch.object(jobs, 'command', return_value=json.dumps(record)):
            self.assertFalse(jobs.has_published_namespace('tool'))
        jobs.has_published_namespace.cache_clear()

    def test_outage_does_not_trigger_a_build(self):
        self.assertFalse(jobs.is_missing('registry/new:tag', 'new', 'TLS handshake timeout'))


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        self.environment = patch.dict(os.environ, {'PACKAGE_RUNNER': 'macos-15', 'GITHUB_REPOSITORY': 'tale/rootbeer-index', 'GITHUB_RUN_ID': '20'})
        self.environment.start()
        self.addCleanup(self.environment.stop)
        self.task = {'package': 'tool@1', 'system': 'aarch64-macos', 'key': 'abc'}
        self.job = {'name': 'macos-15 / tool@1 (aarch64-macos) / Build and check', 'conclusion': 'success',
                    'steps': [{'name': 'Build and check this package', 'conclusion': 'success'}]}
        self.artifact = {'name': 'package-abc-1', 'id': 123, 'expired': False, 'digest': 'sha256:' + 'a' * 64}

    def test_approval_without_started_jobs_needs_no_checkpoint(self):
        self.assertEqual(jobs.retained_artifact(({'run_attempt': 2}, [], []), self.task), '')

    def test_failed_jobs_can_run_again(self):
        self.job['conclusion'] = 'failure'
        self.assertEqual(jobs.retained_artifact(({'run_attempt': 2}, [], [self.job]), self.task), '')

    def test_successful_build_recovers_exact_artifact(self):
        self.assertEqual(jobs.retained_artifact(({'run_attempt': 2}, [self.artifact], [self.job]), self.task), '123')

    def test_missing_or_expired_successful_build_is_not_rebuilt(self):
        for artifacts in ([], [dict(self.artifact, expired=True)], [dict(self.artifact, digest='')]):
            with self.subTest(artifacts=artifacts), self.assertRaisesRegex(ValueError, 'refusing to rebuild'):
                jobs.retained_artifact(({'run_attempt': 2}, artifacts, [self.job]), self.task)

    def test_unmerged_fork_is_not_admitted(self):
        run = {'path': '.github/workflows/package-builds.yml', 'status': 'completed', 'head_sha': 'abc',
               'event': 'pull_request', 'head_branch': 'feature'}
        with patch.object(jobs, 'command', side_effect=[json.dumps(run), '[]']):
            with self.assertRaisesRegex(ValueError, 'exact contributor revision'):
                jobs.retained_results('10')

    def test_merged_fork_with_changed_verifier_is_not_admitted(self):
        run = {'path': '.github/workflows/package-builds.yml', 'status': 'completed', 'head_sha': 'abc',
               'event': 'pull_request', 'head_branch': 'feature'}
        pulls = [{'merged_at': 'now', 'base': {'ref': 'main'}, 'head': {'sha': 'abc'}, 'merge_commit_sha': 'def'}]
        with patch.object(jobs, 'command', side_effect=[json.dumps(run), json.dumps(pulls), '', '', 'changed']), patch.object(jobs.subprocess, 'run'):
            with self.assertRaisesRegex(ValueError, 'tooling differs'):
                jobs.retained_results('10')

    def test_merged_fork_with_matching_verifier_is_admitted(self):
        run = {'path': '.github/workflows/package-builds.yml', 'status': 'completed', 'head_sha': 'abc',
               'event': 'pull_request', 'head_branch': 'feature'}
        pulls = [{'merged_at': 'now', 'base': {'ref': 'main'}, 'head': {'sha': 'abc'}, 'merge_commit_sha': 'def'}]
        responses = [json.dumps(run), json.dumps(pulls), '', '', '', '[{"artifacts":[]}]', '[{"jobs":[]}]']
        with patch.object(jobs, 'command', side_effect=responses) as command, patch.object(jobs.subprocess, 'run'):
            self.assertEqual(jobs.retained_results('10'), (run, [], []))
            comparison = next(call.args for call in command.call_args_list if call.args[:2] == ('git', 'diff'))
            self.assertEqual(comparison[3:5], ('abc', 'def'))


class ProducerTests(unittest.TestCase):
    def test_merge_waits_for_running_pr_then_recovers_it(self):
        with tempfile.TemporaryDirectory() as directory:
            event = Path(directory) / 'event.json'
            event.write_text('{}')
            output = Path(directory) / 'output'
            env = {'GITHUB_EVENT_PATH': str(event), 'GITHUB_OUTPUT': str(output), 'GITHUB_EVENT_NAME': 'push',
                   'GITHUB_REPOSITORY': 'tale/rootbeer-index', 'GITHUB_SHA': 'merge', 'REUSE_RUN': ''}
            pulls = [{'merged_at': 'now', 'base': {'ref': 'main'}, 'head': {'sha': 'head'}}]
            for status, waiting in [('in_progress', 'true'), ('completed', 'false')]:
                output.write_text('')
                with patch.dict(os.environ, env), patch.object(producer, 'api', side_effect=[pulls, {'workflow_runs': [{'id': 123, 'status': status}]}]):
                    producer.main()
                self.assertIn(f'waiting={waiting}', output.read_text())
                if status == 'completed':
                    self.assertIn('reuse-run=123', output.read_text())


if __name__ == '__main__':
    unittest.main()
