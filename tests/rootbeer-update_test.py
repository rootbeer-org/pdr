import copy
import importlib.util
from pathlib import Path
import unittest
import json
import os
import shutil
import subprocess
import tempfile

spec = importlib.util.spec_from_file_location('rootbeer_update', Path(__file__).resolve().parents[1] / '.github/scripts/rootbeer-update.py')
updates = importlib.util.module_from_spec(spec)
spec.loader.exec_module(updates)


class RecipeTests(unittest.TestCase):
    source = '''return {
    source = { url = "old" },
    platforms = {
        ["aarch64-macos"] = { default_version = "0.1.0-main+aaaaaaaaaaaa" },
        ["x86_64-linux"] = { default_version = "0.1.0-main+aaaaaaaaaaaa" },
    },
    versions = {
        ["0.1.0-main+aaaaaaaaaaaa"] = { digests = { ["aarch64-macos"] = "old", ["x86_64-linux"] = "old" } },
    },
}'''
    systems = ['aarch64-macos', 'x86_64-linux']
    build = {'backend': 'rust', 'rust': {'packages': ['tool'],
                                        'environment': {'KEEP': 'value', 'RB_BUILD_TIMESTAMP': 'stale'}}}

    def update(self, source, revision='b' * 40):
        return updates.update_recipe(source, self.systems, revision, '0.1.0', 'c' * 64, self.build)

    def test_update_advances_every_platform_and_is_idempotent(self):
        result = self.update(self.source)
        self.assertEqual(result.count('default_version = "0.1.0-main+bbbbbbbbbbbb"'), 2)
        self.assertIn(self.source.split('versions = {')[1], result)
        self.assertIn('source = { url = "old" }', result)
        for system in self.systems:
            self.assertIn(f'["{system}"] = "{"c" * 64}"', result)
        self.assertIn(f'["RB_SOURCE_REVISION"] = "{"b" * 40}"', result)
        self.assertNotIn('RB_BUILD_TIMESTAMP', result)
        self.assertIn('["KEEP"] = "value"', result)
        self.assertIn('["packages"] = { "tool" }', result)
        self.assertEqual(result, self.update(result))

    def test_rejects_invalid_identity(self):
        with self.assertRaises(ValueError):
            self.update(self.source, '../bad')

    def test_rejects_a_platform_without_a_default_version(self):
        source = self.source.replace('["x86_64-linux"] = { default_version = "0.1.0-main+aaaaaaaaaaaa" },', '')
        with self.assertRaisesRegex(ValueError, 'one default version per platform'):
            self.update(source)

    def test_rejects_rollback_to_retained_version(self):
        source = self.source.replace('versions = {', 'versions = { ["0.1.0-main+bbbbbbbbbbbb"] = {},')
        with self.assertRaises(ValueError):
            self.update(source)

    def test_empty_build_lists_are_omitted(self):
        build = {'backend': 'rust', 'configure': [], 'rust': {'features': [], 'no_default_features': False}}
        self.assertEqual(updates.authored_build(build),
                         {'backend': 'rust', 'rust': {'no_default_features': False}})

    @unittest.skipUnless(os.environ.get('ROOTBEER_FORGE'), 'set ROOTBEER_FORGE for catalog regression')
    def test_expanded_catalog_preserves_all_retained_inputs(self):
        engine = str(Path(os.environ['ROOTBEER_FORGE']).resolve())
        packages = Path(__file__).resolve().parents[1] / 'packages'
        before = json.loads(subprocess.check_output([engine, '--catalog', str(packages), 'catalog']))
        package = before['packages']['rootbeer']
        build, systems = updates.default_build(package)
        with tempfile.TemporaryDirectory() as directory:
            shutil.copytree(packages, directory, dirs_exist_ok=True)
            recipe = Path(directory) / 'rootbeer.lua'
            recipe.write_text(updates.update_recipe(recipe.read_text(), systems, 'f' * 40, '99.0.0',
                              'c' * 64, build))
            after = json.loads(subprocess.check_output([engine, '--catalog', directory, 'catalog']))
        updated = after['packages']['rootbeer']
        self.assertEqual(set(updated['default_versions'].values()), {'99.0.0-main+ffffffffffff'})
        new = updated['versions'].pop('99.0.0-main+ffffffffffff')
        self.assertEqual(sorted(new['platforms']), systems)
        updated['default_versions'] = package['default_versions']
        self.assertEqual(before, after)
        for system, contract in new['platforms'].items():
            self.assertEqual(contract['build']['sha256'], 'c' * 64)
            environment = contract['build']['rust']['environment']
            self.assertEqual(environment.pop('RB_SOURCE_REVISION'), 'f' * 40)
            self.assertNotIn('RB_BUILD_TIMESTAMP', environment)
            expected = package['versions'][package['default_versions'][system]]['platforms'][system]['build']['rust']
            expected = copy.deepcopy(expected)
            expected['environment'].pop('RB_BUILD_TIMESTAMP', None)
            expected['environment'].pop('RB_SOURCE_REVISION', None)
            self.assertEqual(expected, contract['build']['rust'])

if __name__ == '__main__':
    unittest.main()
