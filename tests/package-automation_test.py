import importlib.util
import os
from pathlib import Path
import subprocess
import tempfile
import unittest


def module(name):
    spec = importlib.util.spec_from_file_location(name, Path(__file__).resolve().parents[1] / '.github/scripts' / f'{name}.py')
    loaded = importlib.util.module_from_spec(spec)
    spec.loader.exec_module(loaded)
    return loaded


proposals = module('propose-updates')
published_at = module('published-at')


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

    def test_rootbeer_always_proposes_on_its_own_lane(self):
        self.assertEqual(proposals.split_lanes(['kitty@0.49.0', 'rootbeer@0.1.0-main+a248a77d983a', 'zoxide@1.0']),
                         {'packages': ['kitty@0.49.0', 'zoxide@1.0'],
                          'engine': ['rootbeer@0.1.0-main+a248a77d983a']})
        self.assertEqual(proposals.split_lanes(['kitty@0.49.0']), {'packages': ['kitty@0.49.0']})

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


class PublishedTimeTests(unittest.TestCase):
    def commit(self, repository, recipe, time):
        path = Path(repository) / 'packages' / 'tool.lua'
        path.parent.mkdir(exist_ok=True)
        path.write_text(recipe)
        environment = dict(os.environ, GIT_AUTHOR_DATE=f'@{time}', GIT_COMMITTER_DATE=f'@{time}',
                           GIT_AUTHOR_NAME='test', GIT_AUTHOR_EMAIL='test@example.com',
                           GIT_COMMITTER_NAME='test', GIT_COMMITTER_EMAIL='test@example.com')
        subprocess.run(['git', '-C', repository, 'add', '-A'], check=True, env=environment)
        subprocess.run(['git', '-C', repository, '-c', 'commit.gpgsign=false', 'commit', '-qm', 'recipe'],
                       check=True, env=environment)

    def test_a_version_dates_from_when_it_first_appeared(self):
        with tempfile.TemporaryDirectory() as repository:
            subprocess.run(['git', 'init', '-q', repository], check=True)
            self.commit(repository, 'versions = { ["1.0"] = {} }', 1_700_000_000)
            self.commit(repository, 'versions = { ["1.0"] = {}, ["2.0"] = {} }', 1_700_100_000)
            self.commit(repository, 'versions = { ["1.0"] = { revision = 2 }, ["2.0"] = {} }', 1_700_200_000)
            self.assertEqual(published_at.first_appearance('tool', '1.0', repository), 1_700_000_000)
            self.assertEqual(published_at.first_appearance('tool', '2.0', repository), 1_700_100_000)
            with self.assertRaises(ValueError):
                published_at.first_appearance('tool', '3.0', repository)

if __name__ == '__main__':
    unittest.main()
