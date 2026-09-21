import json
import os
from pathlib import Path
import subprocess
import tempfile


def command(*args):
    return subprocess.check_output(args, text=True).strip()


def catalog(directory):
    return json.loads(command('engine-bin/rootbeer-forge', '--catalog', str(directory), 'index'))['packages']


def changed_requests(before, after):
    changed = set()
    for name, package in after.items():
        old = before.get(name, {}).get('versions', {})
        for version, recipe in package['versions'].items():
            if old.get(version) != recipe:
                changed.add(f'{name}@{version}')
    while True:
        affected = set(changed)
        for name, package in after.items():
            for version, recipe in package['versions'].items():
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
    if explicit:
        requests = explicit.split()
    elif base and set(base) != {'0'}:
        with tempfile.TemporaryDirectory() as temporary:
            archive = subprocess.Popen(['git', 'archive', base, 'packages'], stdout=subprocess.PIPE)
            subprocess.run(['tar', '-x', '-C', temporary], stdin=archive.stdout, check=True)
            archive.stdout.close()
            if archive.wait():
                raise ValueError('Could not read the previous approved recipes')
            requests = changed_requests(catalog(Path(temporary) / 'packages'), catalog(directory))
    else:
        requests = []
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'packages={" ".join(requests)}\n')
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'{len(requests)} changed package versions.\n')
        summary.writelines(f'- `{request}`\n' for request in requests)


if __name__ == '__main__':
    main()
