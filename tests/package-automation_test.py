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
proposals = module('propose-updates')


class ProposalLockTests(unittest.TestCase):
    def pull(self, branch, *paths):
        return {'headRefName': branch, 'url': f'https://example.com/{branch}',
                'files': [{'path': path} for path in paths]}

    def test_disjoint_recipes_propose_concurrently(self):
        open_pulls = [self.pull('updates/packages-1', 'packages/kitty.lua')]
        self.assertIsNone(proposals.conflicting_proposal(open_pulls, ['rootbeer']))

    def test_overlapping_recipe_waits_for_review(self):
        open_pulls = [self.pull('updates/packages-1', 'packages/kitty.lua', 'packages/rootbeer.lua')]
        pending = proposals.conflicting_proposal(open_pulls, ['rootbeer'])
        self.assertEqual(pending['headRefName'], 'updates/packages-1')

    def test_unrelated_branches_never_block(self):
        open_pulls = [self.pull('fix/something', 'packages/rootbeer.lua')]
        self.assertIsNone(proposals.conflicting_proposal(open_pulls, ['rootbeer']))

    def test_lanes_separate_the_engine_from_package_updates(self):
        self.assertEqual(proposals.lane(['rootbeer']), 'engine')
        self.assertEqual(proposals.lane(['kitty']), 'packages')
        self.assertEqual(proposals.lane(['kitty', 'rootbeer']), 'packages')

    def test_open_lane_proposal_is_reused(self):
        open_pulls = [self.pull('updates/packages-1', 'packages/kitty.lua'),
                      self.pull('updates/engine-2', 'packages/rootbeer.lua')]
        self.assertEqual(proposals.lane_proposal(open_pulls, 'engine')['headRefName'], 'updates/engine-2')
        self.assertIsNone(proposals.lane_proposal([], 'engine'))


class CoalescingTests(unittest.TestCase):
    def test_newer_version_replaces_the_pending_one(self):
        body = proposals.body_text(['kitty@0.48.2', 'zoxide@1.0'])
        self.assertEqual(proposals.coalesced_requests(body, ['kitty@0.49.0']),
                         ['kitty@0.49.0', 'zoxide@1.0'])

    def test_first_proposal_keeps_its_requests(self):
        self.assertEqual(proposals.coalesced_requests('', ['kitty@0.49.0']), ['kitty@0.49.0'])

    def test_a_package_can_propose_one_version_per_platform(self):
        body = proposals.body_text(['kitty@0.48.2', 'zoxide@1.0'])
        self.assertEqual(proposals.coalesced_requests(body, ['kitty@0.49.0', 'kitty@0.49.1']),
                         ['kitty@0.49.0', 'kitty@0.49.1', 'zoxide@1.0'])

    def test_body_round_trips(self):
        requests = ['kitty@0.49.0', 'rootbeer@0.1.0-main+a248a77d983a']
        self.assertEqual(proposals.coalesced_requests(proposals.body_text(requests), []), requests)


def version(revision=1, **platforms):
    return {'license': 'MIT', 'revision': revision, 'platforms': platforms}


class SelectionTests(unittest.TestCase):
    def test_metadata_does_not_rebuild_and_dependencies_propagate(self):
        linux = 'x86_64-linux'
        before = {'lib': {'description': 'old', 'versions': {'1': version(**{linux: {}})}},
                  'tool': {'versions': {'2': version(**{linux: {'build': {'dependencies': ['lib@1']}}})}},
                  'app': {'versions': {'3': version(**{linux: {'build': {'dependencies': [{'package': 'tool@2', 'kind': 'build'}]}}})}}}
        after = copy.deepcopy(before)
        after['lib']['description'] = 'new'
        self.assertEqual(selection.changed_requests(before, after), [])
        after['lib']['versions']['1']['revision'] = 2
        self.assertEqual(selection.changed_requests(before, after), ['app@3', 'lib@1', 'tool@2'])
        self.assertEqual(selection.changed_requests(before, after, linux), ['app@3', 'lib@1', 'tool@2'])

    def test_a_dependency_on_another_platform_does_not_propagate(self):
        before = {'lib': {'versions': {'1': version(**{'aarch64-macos': {}, 'x86_64-linux': {}})}},
                  'tool': {'versions': {'2': version(**{'aarch64-macos': {},
                                                        'x86_64-linux': {'build': {'dependencies': ['lib@1']}}})}}}
        after = copy.deepcopy(before)
        after['lib']['versions']['1']['platforms']['aarch64-macos']['sha256'] = 'new'
        self.assertEqual(selection.changed_requests(before, after, 'aarch64-macos'), ['lib@1'])
        self.assertEqual(selection.changed_requests(before, after, 'x86_64-linux'), [])


class PlatformSelectionTests(unittest.TestCase):
    systems = ['aarch64-linux', 'aarch64-macos', 'x86_64-linux']

    def kitty(self):
        return {'kitty': {'default_versions': dict.fromkeys(self.systems, '0.48.2'),
                          'versions': {'0.48.2': version(**{system: {'sha256': system} for system in self.systems})}}}

    def test_a_macos_bump_selects_macos_alone(self):
        before = self.kitty()
        after = copy.deepcopy(before)
        after['kitty']['versions']['0.49.0'] = version(**{'aarch64-macos': {'sha256': 'new'}})
        after['kitty']['default_versions']['aarch64-macos'] = '0.49.0'
        self.assertEqual(selection.changed_requests(before, after), ['kitty@0.49.0'])
        self.assertEqual(selection.changed_requests(before, after, 'aarch64-macos'), ['kitty@0.49.0'])
        for system in ['aarch64-linux', 'x86_64-linux']:
            self.assertEqual(selection.changed_requests(before, after, system), [])

    def test_changing_one_platform_contract_leaves_the_others_alone(self):
        before = self.kitty()
        after = copy.deepcopy(before)
        after['kitty']['versions']['0.48.2']['platforms']['aarch64-macos']['apps'] = {'kitty.app': 'kitty.app'}
        self.assertEqual(selection.changed_requests(before, after, 'aarch64-macos'), ['kitty@0.48.2'])
        for system in ['aarch64-linux', 'x86_64-linux']:
            self.assertEqual(selection.changed_requests(before, after, system), [])
        after['kitty']['versions']['0.48.2']['revision'] = 2
        self.assertEqual(selection.changed_requests(before, after, 'x86_64-linux'), ['kitty@0.48.2'])


class RegistryTests(unittest.TestCase):
    def test_denied_is_missing_only_for_an_unpublished_name(self):
        error = 'Error response from registry: denied: requested access to the resource is denied'
        with patch.object(jobs, 'has_published_namespace', side_effect=lambda name: name == 'existing'):
            self.assertTrue(jobs.is_missing('registry/new:tag', 'new', error))
            self.assertFalse(jobs.is_missing('registry/existing:tag', 'existing', error))

    def published(self, source):
        root = {'schema': 3, 'packages': {'tool': {'document': 'a' * 64}}}
        document = {'name': 'tool', 'versions': {'1': {'platforms': {'system': {'record': 'b' * 64}}}}}
        record = {'record': {'artifact': {'package': {'source': {'Url': {'url': source}}}}}}
        responses = {'packages': document, 'records': record}
        return (patch.dict(os.environ, {'PACKAGE_REGISTRY': 'rootbeer-org/pdr'}),
                patch.object(jobs, 'published_root', return_value=('revision', root)),
                patch.object(jobs, 'published_json', side_effect=lambda _, path, __: responses[path]))

    def test_nothing_is_published_before_the_first_v3_root(self):
        jobs.has_published_namespace.cache_clear()
        with patch.object(jobs, 'published_root', return_value=None):
            self.assertFalse(jobs.has_published_namespace('tool'))
        jobs.has_published_namespace.cache_clear()

    def test_a_package_the_root_does_not_list_is_unpublished(self):
        jobs.has_published_namespace.cache_clear()
        environment, root, documents = self.published('ghcr://rootbeer-org/pdr/tool@sha256:' + 'c' * 64)
        with environment, root, documents:
            self.assertFalse(jobs.has_published_namespace('new'))
        jobs.has_published_namespace.cache_clear()

    def test_only_a_ghcr_record_establishes_the_namespace(self):
        for source, expected in [('ghcr://rootbeer-org/pdr/tool@sha256:' + 'c' * 64, True),
                                 ('https://upstream.example/tool.zip', False)]:
            jobs.has_published_namespace.cache_clear()
            environment, root, documents = self.published(source)
            with environment, root, documents:
                self.assertEqual(jobs.has_published_namespace('tool'), expected, source)
        jobs.has_published_namespace.cache_clear()

    def test_outage_does_not_trigger_a_build(self):
        self.assertFalse(jobs.is_missing('registry/new:tag', 'new', 'TLS handshake timeout'))


class ProducerSelectionTests(unittest.TestCase):
    def test_completed_verification_wins_over_unstarted_pr_run(self):
        verified = {'id': 10, 'event': 'workflow_dispatch', 'status': 'completed', 'conclusion': 'success'}
        unstarted = {'id': 11, 'event': 'pull_request', 'status': 'completed', 'conclusion': 'failure'}
        self.assertEqual(producer.verification_run([verified, unstarted]), verified)
        self.assertEqual(producer.verification_run([unstarted]), unstarted)


class RecoveryTests(unittest.TestCase):
    def setUp(self):
        self.environment = patch.dict(os.environ, {'PACKAGE_RUNNER': 'macos-15', 'GITHUB_REPOSITORY': 'rootbeer-org/pdr', 'GITHUB_RUN_ID': '20'})
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
                   'GITHUB_REPOSITORY': 'rootbeer-org/pdr', 'GITHUB_SHA': 'merge', 'REUSE_RUN': ''}
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
