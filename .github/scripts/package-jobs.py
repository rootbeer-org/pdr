import json
import os
from pathlib import Path
import re
import subprocess


def command(*arguments):
    return subprocess.check_output(arguments, text=True).strip()


def retained_results(run_id):
    if not re.fullmatch(r'[1-9][0-9]*', run_id):
        raise ValueError('Reuse requires a workflow run ID')
    repository = os.environ['GITHUB_REPOSITORY']
    base = f'repos/{repository}/actions/runs/{run_id}'
    run = json.loads(command('gh', 'api', base))
    if (run['status'] != 'completed' or run['event'] != 'workflow_dispatch'
            or run['head_branch'] != 'main' or run['head_repository']['full_name'] != repository
            or run['path'] != '.github/workflows/package-builds.yml'):
        raise ValueError('Reuse requires completed package verification on approved main')
    comparison = json.loads(command('gh', 'api', f"repos/{repository}/compare/{run['head_sha']}...{os.environ['GITHUB_SHA']}"))
    if comparison['status'] not in ('ahead', 'identical'):
        raise ValueError('Producer revision is not an ancestor of this approved commit')
    def pages(suffix, field):
        responses = json.loads(command('gh', 'api', '--paginate', '--slurp', f'{base}/{suffix}?per_page=100'))
        return [item for response in responses for item in response[field]]
    return run, pages('artifacts', 'artifacts'), pages('jobs', 'jobs')


def retained_artifact(retained, task):
    run, artifacts, jobs = retained
    expected_job = f"{os.environ['PACKAGE_RUNNER']} / {task['package']} ({task['system']}) / Build and check"
    if not any(job['name'] == expected_job and job['conclusion'] == 'success'
               and any(step['name'] in ('Build and check this package', 'Recover the admitted verified build')
                       and step['conclusion'] == 'success' for step in job.get('steps', []))
               for job in jobs):
        raise ValueError(f'{expected_job}: no successful verification to recover')
    prefix = f"package-{task['key']}-"
    matches = [artifact for artifact in artifacts if not artifact['expired']
               and artifact['name'].startswith(prefix)
               and artifact['name'][len(prefix):].isdigit()
               and 0 < int(artifact['name'][len(prefix):]) <= run['run_attempt']]
    if matches:
        latest = max(int(artifact['name'][len(prefix):]) for artifact in matches)
        matches = [artifact for artifact in matches if artifact['name'] == f'{prefix}{latest}']
    if len(matches) != 1 or not re.fullmatch(r'sha256:[a-f0-9]{64}', matches[0].get('digest', '')):
        raise ValueError(f'{prefix}: no intact retained artifact; refusing to rebuild')
    return str(matches[0]['id'])


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
    retained = retained_results(os.environ['REUSE_RUN']) if os.environ.get('REUSE_RUN') else None
    for task in tasks:
        repository = f"{os.environ['PACKAGE_REGISTRY']}/{task['name']}"
        locator = f"ghcr.io/{repository}:inputs-{task['key']}"
        result = subprocess.run(['oras', 'manifest', 'fetch', locator], text=True, capture_output=True)
        if result.returncode:
            if not result.stderr.strip().endswith(f'{locator}: not found'):
                raise RuntimeError(f'Cannot inspect {locator}: {result.stderr}')
            if retained:
                task['artifact'] = retained_artifact(retained, task)
            missing.append(task)
            continue
        manifest = json.loads(result.stdout)
        layers = [layer for layer in manifest.get('layers', [])
                  if layer.get('mediaType') == 'application/vnd.rootbeer.package.record.v1+json']
        if len(layers) != 1 or not re.fullmatch(r'sha256:[a-f0-9]{64}', layers[0]['digest']):
            raise ValueError(f'{locator}: expected one signed package record')
        reference = f"ghcr://{repository}@{layers[0]['digest']}"
        output = []
        if os.environ.get('RECORD_DIRECTORY'):
            directory = Path(os.environ['RECORD_DIRECTORY'])
            directory.mkdir(parents=True, exist_ok=True)
            output = ['--output', str(directory / f"{task['key']}.json")]
        command(engine, 'verify-record', reference, '--package', task['package'],
                '--system', task['system'], '--input-key', task['key'],
                '--public-key', os.environ['PACKAGE_PUBLIC_KEY'], *output)
        reused.append((task, reference))
    if len(missing) > 256:
        raise ValueError('GitHub permits 256 jobs per matrix; submit smaller package selections')
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'matrix={json.dumps({"include": missing}, separators=(",", ":"))}\n')
        output.write(f'has-work={str(bool(missing)).lower()}\n')
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'{len(missing)} packages to build; {len(reused)} signed results reused.\n\n')
        for task in missing:
            action = 'Recover verified build' if task.get('artifact') else 'Build'
            summary.write(f"- {action} `{task['package']}` for `{task['system']}`\n")
        for task, reference in reused:
            summary.write(f"- Reuse `{task['package']}`: `{reference}`\n")


if __name__ == '__main__':
    plan()
