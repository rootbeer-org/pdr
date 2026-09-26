import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


ENGINE = 'rootbeer'
INTRO = 'Update available package recipes. Each affected package/platform is verified independently; merging promotes those exact artifacts.'


def command(*args):
    return subprocess.check_output(args, text=True).strip()


def lane(names):
    return 'engine' if names == [ENGINE] else 'packages'


def split_lanes(requests):
    """Rootbeer always proposes on its own, so its auto-merged lane never carries other packages."""
    lanes = {}
    for request in requests:
        lanes.setdefault(lane([request.split('@')[0]]), []).append(request)
    return lanes


def lane_proposal(pulls, name):
    return next((pull for pull in pulls if pull['headRefName'].startswith(f'updates/{name}-')), None)


def conflicting_proposal(pulls, names):
    """Proposals replace whole recipe files, so two touching one recipe would clobber."""
    recipes = {f'packages/{name}.lua' for name in names}
    return next((pull for pull in pulls
                 if pull['headRefName'].startswith('updates/')
                 and recipes & {item['path'] for item in pull['files']}), None)


def coalesced_requests(body, requests):
    """A lane keeps one open proposal, so a package's new versions replace its pending ones."""
    pending = re.findall(r'^- `([^`]+)`$', body or '', re.M)
    replaced = {request.split('@', 1)[0] for request in requests}
    kept = [request for request in pending if request.split('@', 1)[0] not in replaced]
    return sorted(set(kept) | set(requests))


def body_text(requests):
    return INTRO + '\n\n' + '\n'.join(f'- `{request}`' for request in requests) + '\n'


def propose(repository, pulls, requests):
    names = sorted({request.split('@')[0] for request in requests})
    name = lane(names)
    current = lane_proposal(pulls, name)
    blocking = conflicting_proposal([pull for pull in pulls if pull is not current], names)
    if blocking:
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write(f'Another proposal already updates these recipes: {blocking["url"]}\n')
        return
    # The engine lane holds one whole recipe, so it restarts from main and never goes stale.
    is_engine = name == 'engine'
    if current:
        branch = current['headRefName']
        start = 'origin/main'
        if not is_engine:
            command('git', 'fetch', 'origin', branch)
            start = f'origin/{branch}'
    else:
        branch = f'updates/{name}-{os.environ["GITHUB_RUN_ID"]}'
        start = 'origin/main'
    command('git', 'switch', '--force-create', branch, start)
    for package in names:
        shutil.copyfile(f'candidates/packages/{package}.lua', f'packages/{package}.lua')
    command('git', 'add', '--', *[f'packages/{package}.lua' for package in names])
    if not command('git', 'status', '--porcelain'):
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write(f'{current["url"]} already proposes these recipes\n')
        return
    command('git', 'commit', '-m', 'chore(packages): propose upstream updates')
    push = ['git', 'push', 'origin', f'HEAD:refs/heads/{branch}']
    command(*(push + ['--force'] if is_engine else push))
    selections = requests if is_engine else coalesced_requests(current['body'] if current else '', requests)
    title = 'chore(packages): update rootbeer' if is_engine else 'chore(packages): update available packages'
    with tempfile.TemporaryDirectory() as temporary:
        body = Path(temporary) / 'body.md'
        body.write_text(body_text(selections))
        if current:
            url = current['url']
            command('gh', 'pr', 'edit', url, '--repo', repository, '--title', title, '--body-file', str(body))
        else:
            url = command('gh', 'pr', 'create', '--repo', repository, '--base', 'main', '--head', branch,
                          '--title', title, '--body-file', str(body))
    if is_engine:
        # Required package checks still gate the merge, and merging publishes their verified artifacts.
        number = url.rstrip('/').rsplit('/', 1)[-1]
        command('gh', 'pr', 'merge', url, '--repo', repository, '--auto', '--squash',
                '--subject', f'{title} (#{number})', '--body', '')
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'Recipe changes and per-package checks: {url}\n')


def main():
    repository = os.environ['GITHUB_REPOSITORY']
    requests = os.environ['PACKAGES'].split()
    if not requests or any(not re.fullmatch(r'[a-z0-9][a-z0-9+._-]*@[A-Za-z0-9._+-]+', item) for item in requests):
        raise ValueError('Expected exact package versions')
    pulls = json.loads(command('gh', 'pr', 'list', '--repo', repository, '--state', 'open',
                               '--json', 'headRefName,url,body,files'))
    command('gh', 'auth', 'setup-git')
    command('git', 'fetch', 'origin', 'main')
    if command('git', 'rev-parse', 'origin/main') != os.environ['GITHUB_SHA']:
        raise ValueError('Main advanced during discovery; rerun discovery against current recipes')
    bot = f"{os.environ['APP_SLUG']}[bot]"
    bot_id = command('gh', 'api', f'users/{bot}', '--jq', '.id')
    command('git', 'config', 'user.name', bot)
    command('git', 'config', 'user.email', f'{bot_id}+{bot}@users.noreply.github.com')
    for lane_requests in split_lanes(requests).values():
        propose(repository, pulls, lane_requests)


if __name__ == '__main__':
    main()
