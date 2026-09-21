import json
import os
from pathlib import Path
import re
import shutil
import subprocess
import tempfile


def command(*args):
    return subprocess.check_output(args, text=True).strip()


def main():
    repository = os.environ['GITHUB_REPOSITORY']
    requests = os.environ['PACKAGES'].split()
    if not requests or any(not re.fullmatch(r'[a-z0-9][a-z0-9+._-]*@[A-Za-z0-9._+-]+', item) for item in requests):
        raise ValueError('Expected exact package versions')
    pulls = json.loads(command('gh', 'pr', 'list', '--repo', repository, '--state', 'open', '--json', 'headRefName,url'))
    pending = next((pull for pull in pulls if pull['headRefName'].startswith('updates/packages-')), None)
    if pending:
        with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
            summary.write(f'An upstream update is already awaiting review: {pending["url"]}\n')
        return
    command('gh', 'auth', 'setup-git')
    command('git', 'fetch', 'origin', 'main')
    if command('git', 'rev-parse', 'origin/main') != os.environ['GITHUB_SHA']:
        raise ValueError('Main advanced during discovery; rerun discovery against current recipes')
    branch = f'updates/packages-{os.environ["GITHUB_RUN_ID"]}'
    command('git', 'switch', '-c', branch)
    names = sorted({request.split('@')[0] for request in requests})
    for name in names:
        shutil.copyfile(f'candidates/packages/{name}.lua', f'packages/{name}.lua')
    command('git', 'config', 'user.name', 'github-actions[bot]')
    command('git', 'config', 'user.email', '41898282+github-actions[bot]@users.noreply.github.com')
    command('git', 'add', '--', *[f'packages/{name}.lua' for name in names])
    command('git', 'commit', '-m', 'chore(packages): propose upstream updates')
    command('git', 'push', 'origin', f'HEAD:refs/heads/{branch}')
    with tempfile.TemporaryDirectory() as temporary:
        body = Path(temporary) / 'body.md'
        body.write_text('Update available package recipes. Each affected package/platform is verified independently; merging promotes those exact artifacts.\n\n'
                        + '\n'.join(f'- `{request}`' for request in requests) + '\n')
        url = command('gh', 'pr', 'create', '--repo', repository, '--base', 'main', '--head', branch,
                      '--title', 'chore(packages): update available packages', '--body-file', str(body))
    command('gh', 'workflow', 'run', 'package-builds.yml', '--repo', repository, '--ref', branch,
            '-f', 'packages=' + ' '.join(requests))
    with open(os.environ['GITHUB_STEP_SUMMARY'], 'a') as summary:
        summary.write(f'Recipe changes and per-package checks: {url}\n')


if __name__ == '__main__':
    main()
