import json
import os
import re
import subprocess


def command(*arguments):
    return subprocess.check_output(arguments, text=True).strip()


def plan():
    requests = os.environ['PACKAGES'].split()
    if not requests or any(not re.fullmatch(r'[a-z0-9][a-z0-9+._-]*@[A-Za-z0-9._+-]+', item) for item in requests):
        raise ValueError('Select exact packages: name@version separated by spaces')
    engine = 'engine-bin/rootbeer-forge'
    tasks = json.loads(command(engine, '--catalog', 'packages', 'package-plan',
                               '--context', os.environ['BUILD_CONTEXT'], *requests))
    expected = os.environ.get('EXPECTED_KEY')
    if expected and (len(tasks) != 1 or tasks[0]['key'] != expected):
        raise ValueError('Package inputs changed after planning')
    missing = []
    reused = []
    for task in tasks:
        repository = f"{os.environ['PACKAGE_REGISTRY']}/{task['name']}"
        locator = f"ghcr.io/{repository}:inputs-{task['key']}"
        result = subprocess.run(['oras', 'manifest', 'fetch', locator], text=True, capture_output=True)
        if result.returncode:
            if not result.stderr.strip().endswith(f'{locator}: not found'):
                raise RuntimeError(f'Cannot inspect {locator}: {result.stderr}')
            missing.append(task)
            continue
        manifest = json.loads(result.stdout)
        layers = [layer for layer in manifest.get('layers', [])
                  if layer.get('mediaType') == 'application/vnd.rootbeer.package.record.v1+json']
        if len(layers) != 1 or not re.fullmatch(r'sha256:[a-f0-9]{64}', layers[0]['digest']):
            raise ValueError(f'{locator}: expected one signed package record')
        reference = f"ghcr://{repository}@{layers[0]['digest']}"
        command(engine, 'verify-record', reference, '--package', task['package'],
                '--system', task['system'], '--input-key', task['key'],
                '--public-key', os.environ['PACKAGE_PUBLIC_KEY'])
        reused.append((task, reference))
    if len(missing) > 256:
        raise ValueError('GitHub permits 256 jobs per matrix; submit smaller package selections')
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'matrix={json.dumps({"include": missing}, separators=(",", ":"))}\n')
        output.write(f'has-work={str(bool(missing)).lower()}\n')
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'{len(missing)} packages to build; {len(reused)} signed results reused.\n\n')
        for task in missing:
            summary.write(f"- Build `{task['package']}` for `{task['system']}`\n")
        for task, reference in reused:
            summary.write(f"- Reuse `{task['package']}`: `{reference}`\n")


if __name__ == '__main__':
    plan()
