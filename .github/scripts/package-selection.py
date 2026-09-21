import json
import os
from pathlib import Path
import subprocess
import tempfile


def command(*args):
    return subprocess.check_output(args, text=True).strip()


def catalog(directory):
    return json.loads(command('engine-bin/rootbeer-forge', '--catalog', str(directory), 'index'))['packages']


def platform_recipe(recipe, system):
    if recipe is None or system is None:
        return recipe
    resolved = dict(recipe.get('platforms', {}).get(system, recipe))
    resolved.pop('platforms', None)
    return resolved if system in resolved['systems'] else None


def changed_requests(before, after, system=None):
    changed = set()
    for name, package in after.items():
        old = before.get(name, {}).get('versions', {})
        for version, recipe in package['versions'].items():
            if platform_recipe(old.get(version), system) != platform_recipe(recipe, system):
                changed.add(f'{name}@{version}')
    while True:
        affected = set(changed)
        for name, package in after.items():
            for version, recipe in package['versions'].items():
                recipe = platform_recipe(recipe, system)
                if recipe is None:
                    continue
                dependencies = recipe.get('build', {}).get('dependencies', [])
                dependencies = [item if isinstance(item, str) else item['package'] for item in dependencies]
                if changed.intersection(dependencies):
                    affected.add(f'{name}@{version}')
        if affected == changed:
            return sorted(changed)
        changed = affected


def main():
    explicit = os.environ.get('PACKAGES', '').strip()
    base = os.environ.get('BASE_REVISION', '')
    directory = os.environ.get('CATALOG', 'packages')
    after = catalog(directory)
    before = None
    if explicit:
        requests = explicit.split()
    elif base and set(base) != {'0'}:
        with tempfile.TemporaryDirectory() as temporary:
            archive = subprocess.Popen(['git', 'archive', base, 'packages'], stdout=subprocess.PIPE)
            subprocess.run(['tar', '-x', '-C', temporary], stdin=archive.stdout, check=True)
            archive.stdout.close()
            if archive.wait():
                raise ValueError('Could not read the previous approved recipes')
            before = catalog(Path(temporary) / 'packages')
            requests = changed_requests(before, after)
    else:
        requests = []
    platforms = []
    for runner, system in [('ubuntu-24.04', 'x86_64-linux'), ('ubuntu-24.04-arm', 'aarch64-linux'), ('macos-15', 'aarch64-macos')]:
        selected = changed_requests(before, after, system) if before is not None else requests
        selected = [request for request in selected if platform_recipe(after[request.split('@')[0]]['versions'][request.split('@')[1]], system) is not None]
        if selected:
            platforms.append({'runner': runner, 'packages': ' '.join(selected)})
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'platforms={json.dumps({"include": platforms}, separators=(",", ":"))}\n')
        output.write(f'packages={" ".join(requests)}\n')
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'{len(requests)} changed package versions.\n')
        summary.writelines(f'- `{request}`\n' for request in requests)


if __name__ == '__main__':
    main()
