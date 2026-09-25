import json
from functools import lru_cache
import os
from pathlib import Path
import re
import subprocess


def command(*arguments):
    return subprocess.check_output(arguments, text=True).strip()


@lru_cache(maxsize=1)
def published_root():
    """The deployed v3 root and the gh-pages revision it came from, or None before the first."""
    command('git', 'fetch', '--depth=1', '--no-tags', 'origin', 'gh-pages')
    revision = command('git', 'rev-parse', 'FETCH_HEAD')
    try:
        root = json.loads(command('git', 'show', f'{revision}:public/v3/current.json'))
    except subprocess.CalledProcessError:
        return None
    if root.get('schema') != 3:
        raise ValueError('Expected a v3 PDR root before planning new namespaces')
    return revision, root


def published_json(revision, path, digest):
    if not re.fullmatch(r'[a-f0-9]{64}', digest):
        raise ValueError(f'Invalid published digest in {path}')
    return json.loads(command('git', 'show', f'{revision}:public/v3/{path}/{digest}.json'))


@lru_cache(maxsize=None)
def has_published_namespace(name):
    published = published_root()
    if published is None:
        return False
    revision, root = published
    package = root['packages'].get(name)
    if package is None:
        return False
    prefix = f"ghcr://{os.environ['PACKAGE_REGISTRY']}/{name}@"
    document = published_json(revision, 'packages', package['document'])
    for version in document['versions'].values():
        for platform in version['platforms'].values():
            signed = published_json(revision, 'records', platform['record'])
            source = signed['record']['artifact']['package']['source']
            if source.get('Url', {}).get('url', '').startswith(prefix):
                return True
    return False


def is_missing(locator, name, error):
    if error.strip().endswith(f'{locator}: not found'):
        return True
    # Catalog entries can precede binaries; only actual GHCR records establish a published namespace.
    return 'denied: requested access to the resource is denied' in error and not has_published_namespace(name)


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
        if command('git', 'diff', '--name-only', run['head_sha'], revision, '--', *trusted):
            raise ValueError('Producer verification tooling differs from approved tooling')
    def pages(suffix, field):
        responses = json.loads(command('gh', 'api', '--paginate', '--slurp', f'{base}/{suffix}'))
        return [item for response in responses for item in response[field]]
    return run, pages('artifacts?per_page=100', 'artifacts'), pages('jobs?filter=all&per_page=100', 'jobs')


def retained_artifact(retained, task):
    """The verified build a successful job retained, with the key it was built under. A builder on
    another runner image qualified other inputs than this planner computes, so follow the job."""
    run, artifacts, jobs = retained
    expected_job = f"{os.environ['PACKAGE_RUNNER']} / {task['package']} ({task['system']}) / Build {task['package']}"
    built = [job for job in jobs if job['name'].endswith(expected_job) and job['conclusion'] == 'success'
             and any(step['name'] in ('Build and check this package', 'Recover the admitted verified build')
                     and step['conclusion'] == 'success' for step in job.get('steps', []))]
    if not built:
        return '', ''
    job = max(built, key=lambda job: job['run_attempt'])
    log = command('gh', 'api', '--allow-escape-sequences',
                  f"repos/{os.environ['GITHUB_REPOSITORY']}/actions/jobs/{job['id']}/logs")
    uploads = re.findall(r'Artifact (package-([a-f0-9]{64})-([0-9]+)) successfully finalized\. Artifact ID ([0-9]+)', log)
    matches = [artifact for name, _, attempt, identifier in uploads for artifact in artifacts
               if str(artifact['id']) == identifier and artifact['name'] == name and not artifact['expired']
               and 0 < int(attempt) <= run['run_attempt']]
    if len(uploads) != 1 or len(matches) != 1 or not re.fullmatch(r'sha256:[a-f0-9]{64}', matches[0].get('digest', '')):
        raise ValueError(f"{task['package']} {task['system']}: no intact retained artifact; refusing to rebuild")
    return str(matches[0]['id']), uploads[0][1]


def published_dependencies():
    """Planning flags that key dependencies as their published builds; a builder reads the root its
    planner used, so a publication in between cannot change its key."""
    flags = ['--pdr', os.environ['PDR_URL'], '--pdr-public-key', os.environ['PACKAGE_PUBLIC_KEY']]
    if os.environ.get('PDR_ROOT'):
        flags += ['--pdr-root', os.environ['PDR_ROOT']]
    return flags


def check_planned(expected, tasks, planned_context, context):
    """A builder on another runner image than its planner has different inputs, so it keeps its own
    key; on the same image the keys must agree, or the recipes changed after planning."""
    if len(tasks) != 1 or (planned_context in ('', context) and tasks[0]['key'] != expected):
        raise ValueError(f'Package inputs changed after planning: expected {expected}, resolved {json.dumps(tasks)}')


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
                                 '--context', os.environ['BUILD_CONTEXT'], *published_dependencies(), request],
                                text=True, capture_output=True)
        if result.returncode:
            tasks.append({'package': request, 'name': request.split('@')[0], 'system': system,
                          'error': result.stderr.strip(), 'key': ''})
            continue
        tasks.extend(json.loads(result.stdout))
    expected = os.environ.get('EXPECTED_KEY')
    if expected:
        check_planned(expected, tasks, os.environ.get('PLANNED_CONTEXT', ''), os.environ['BUILD_CONTEXT'])
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
                task['artifact'], key = retained_artifact(retained, task)
                task['key'] = key or task['key']
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
        if expected:
            output.write(f"key={tasks[0]['key']}\n")
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'{len(missing)} packages to build; {len(reused)} signed results reused.\n\n')
        for task in missing:
            action = 'Recover verified build' if task.get('artifact') else 'Build'
            summary.write(f"- {action} `{task['package']}` for `{task['system']}`\n")
        for task, reference in reused:
            summary.write(f"- Reuse `{task['package']}`: `{reference}`\n")


if __name__ == '__main__':
    plan()
