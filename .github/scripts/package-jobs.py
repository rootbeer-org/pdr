import json
from functools import lru_cache
import os
from pathlib import Path
import re
import subprocess


def command(*arguments):
    return subprocess.check_output(arguments, text=True).strip()


@lru_cache(maxsize=1)
def published_names():
    command('git', 'fetch', '--depth=1', '--no-tags', 'origin', 'gh-pages')
    manifest = json.loads(command('git', 'show', 'FETCH_HEAD:public/current.json'))
    if manifest.get('schema') != 2:
        raise ValueError('Expected deployed package discovery before planning new namespaces')
    return set(manifest['catalog']['packages'])


def is_missing(locator, name, error):
    if error.strip().endswith(f'{locator}: not found'):
        return True
    # GHCR hides nonexistent namespaces behind DENIED; approved discovery identifies first publication.
    return 'denied: requested access to the resource is denied' in error and name not in published_names()


def retained_results(run_id):
    if not re.fullmatch(r'[1-9][0-9]*', run_id):
        raise ValueError('Reuse requires a workflow run ID')
    repository = os.environ['GITHUB_REPOSITORY']
    base = f'repos/{repository}/actions/runs/{run_id}'
    run = json.loads(command('gh', 'api', base))
    is_retry = run_id == os.environ['GITHUB_RUN_ID']
    if not is_retry and run['status'] != 'completed':
        raise ValueError('Producer verification is still running')
    if run['path'] != '.github/workflows/package-builds.yml':
        raise ValueError('Unrecognized package producer')
    revision = run['head_sha']
    if not is_retry and (run['event'] == 'pull_request' or run['head_branch'] != 'main'):
        pulls = json.loads(command('gh', 'api', f'repos/{repository}/commits/{revision}/pulls'))
        approved = [pull for pull in pulls if pull['merged_at'] and pull['base']['ref'] == 'main'
                    and pull['head']['sha'] == revision]
        if not approved:
            raise ValueError('PR results require the exact contributor revision to be merged')
        revision = approved[0]['merge_commit_sha']
    elif not is_retry and (run['head_branch'] != 'main' or run['head_repository']['full_name'] != repository):
        raise ValueError('Producer must run on approved main or an exactly merged PR')
    if not is_retry:
        command('git', 'fetch', '--no-tags', 'origin', revision)
        subprocess.run(['git', 'merge-base', '--is-ancestor', revision, 'HEAD'], check=True)
        command('git', 'fetch', '--no-tags', 'origin', run['head_sha'])
        trusted = ['.github/workflows/package-builds.yml', '.github/workflows/package-platform.yml',
                   '.github/workflows/package-job.yml', '.github/scripts/package-jobs.py',
                   '.github/scripts/package-selection.py', '.github/actions/setup-engine',
                   '.github/actions/setup-package-tools', 'package-engine-revision']
        if command('git', 'diff', '--name-only', run['head_sha'], 'HEAD', '--', *trusted):
            raise ValueError('Producer verification tooling differs from approved tooling')
    def pages(suffix, field):
        responses = json.loads(command('gh', 'api', '--paginate', '--slurp', f'{base}/{suffix}'))
        return [item for response in responses for item in response[field]]
    return run, pages('artifacts?per_page=100', 'artifacts'), pages('jobs?filter=all&per_page=100', 'jobs')


def retained_artifact(retained, task):
    run, artifacts, jobs = retained
    expected_job = f"{os.environ['PACKAGE_RUNNER']} / {task['package']} ({task['system']}) / Build and check"
    if not any(job['name'].endswith(expected_job) and job['conclusion'] == 'success'
               and any(step['name'] in ('Build and check this package', 'Recover the admitted verified build')
                       and step['conclusion'] == 'success' for step in job.get('steps', []))
               for job in jobs):
        return ''
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
    tasks = []
    system = {'ubuntu-24.04': 'x86_64-linux', 'ubuntu-24.04-arm': 'aarch64-linux',
              'macos-15': 'aarch64-macos'}[os.environ['PACKAGE_RUNNER']]
    for request in requests:
        result = subprocess.run([engine, '--catalog', os.environ.get('CATALOG', 'packages'), 'package-plan',
                                 '--context', os.environ['BUILD_CONTEXT'], request], text=True, capture_output=True)
        if result.returncode:
            tasks.append({'package': request, 'name': request.split('@')[0], 'system': system,
                          'error': result.stderr.strip(), 'key': ''})
            continue
        tasks.extend(json.loads(result.stdout))
    expected = os.environ.get('EXPECTED_KEY')
    if expected and (len(tasks) != 1 or tasks[0]['key'] != expected):
        raise ValueError('Package inputs changed after planning')
    missing = []
    reused = []
    reuse_run = os.environ.get('REUSE_RUN', '')
    if not expected and not reuse_run and int(os.environ.get('GITHUB_RUN_ATTEMPT', '1')) > 1:
        reuse_run = os.environ['GITHUB_RUN_ID']
    retained = retained_results(reuse_run) if reuse_run else None
    for task in tasks:
        if task.get('error'):
            missing.append(task)
            continue
        repository = f"{os.environ['PACKAGE_REGISTRY']}/{task['name']}"
        locator = f"ghcr.io/{repository}:inputs-{task['key']}"
        result = subprocess.run(['oras', 'manifest', 'fetch', locator], text=True, capture_output=True)
        if result.returncode:
            if not is_missing(locator, task['name'], result.stderr):
                raise RuntimeError(f'Cannot inspect {locator}: {result.stderr}')
            if retained:
                task['artifact'] = retained_artifact(retained, task)
                task['reuse_run'] = reuse_run
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
    Path('package-plan.json').write_text(json.dumps({'tasks': tasks, 'reused': [task['key'] for task, _ in reused]}))
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
