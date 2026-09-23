"""When a package version first appeared in its recipe, to date records re-signed by the v3 republish."""
import json
from pathlib import Path
import subprocess
import sys


def first_appearance(name, version, repository='.'):
    times = subprocess.check_output(
        ['git', '-C', str(repository), 'log', '--format=%ct', f'-S["{version}"]', '--', f'packages/{name}.lua'],
        text=True).split()
    if not times:
        raise ValueError(f'{name}@{version} never appears in its recipe history')
    return int(times[-1])


def main():
    name, receipt = sys.argv[1:]
    version = json.loads(Path(receipt).read_text())['package']['version']
    print(first_appearance(name, version))


if __name__ == '__main__':
    main()
