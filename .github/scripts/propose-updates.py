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


def main():
    repository = os.environ['GITHUB_REPOSITORY']
    requests = os.environ['PACKAGES'].split()
    if not requests or any(not re.fullmatch(r'[a-z0-9][a-z0-9+._-]*@[A-Za-z0-9._+-]+', item) for item in requests):
        raise ValueError('Expected exact package versions')
    names = sorted({request.split('@')[0] for request in requests})
    pulls = json.loads(command('gh', 'pr', 'list', '--repo', repository, '--state', 'open',
                               '--json', 'headRefName,url,body,files'))
    current = lane_proposal(pulls, lane(names))
    blocking = conflicting_proposal([pull for pull in pulls if pull is not current], names)
    if blocking:
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write(f'Another proposal already updates these recipes: {blocking["url"]}\n')
        return
    command('gh', 'auth', 'setup-git')
    command('git', 'fetch', 'origin', 'main')
    if command('git', 'rev-parse', 'origin/main') != os.environ['GITHUB_SHA']:
        raise ValueError('Main advanced during discovery; rerun discovery against current recipes')
    if current:
        branch = current['headRefName']
        command('git', 'fetch', 'origin', branch)
        command('git', 'switch', '-c', branch, f'origin/{branch}')
    else:
        branch = f'updates/{lane(names)}-{os.environ["GITHUB_RUN_ID"]}'
        command('git', 'switch', '-c', branch)
    for name in names:
        shutil.copyfile(f'candidates/packages/{name}.lua', f'packages/{name}.lua')
    command('git', 'config', 'user.name', 'github-actions[bot]')
    command('git', 'config', 'user.email', '41898282+github-actions[bot]@users.noreply.github.com')
    command('git', 'add', '--', *[f'packages/{name}.lua' for name in names])
    if not command('git', 'status', '--porcelain'):
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write(f'{current["url"]} already proposes these recipes\n')
        return
    command('git', 'commit', '-m', 'chore(packages): propose upstream updates')
    command('git', 'push', 'origin', f'HEAD:refs/heads/{branch}')
    selections = coalesced_requests(current['body'] if current else '', requests)
    with tempfile.TemporaryDirectory() as temporary:
        body = Path(temporary) / 'body.md'
        body.write_text(body_text(selections))
        if current:
            url = current['url']
            command('gh', 'pr', 'edit', url, '--repo', repository, '--body-file', str(body))
        else:
            url = command('gh', 'pr', 'create', '--repo', repository, '--base', 'main', '--head', branch,
                          '--title', 'chore(packages): update available packages', '--body-file', str(body))
    command('gh', 'workflow', 'run', 'package-builds.yml', '--repo', repository, '--ref', branch,
            '-f', 'packages=' + ' '.join(requests))
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'Recipe changes and per-package checks: {url}\n')


if __name__ == '__main__':
    main()
