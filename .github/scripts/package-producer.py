import json
import os
import subprocess
from pathlib import Path


def api(path):
    return json.loads(subprocess.check_output(['gh', 'api', path]))


def verification_run(runs):
    return max(runs, key=lambda run: (run.get('conclusion') == 'success', run['id']))


def main():
    event = json.loads(Path(os.environ['GITHUB_EVENT_PATH']).read_text())
    repository = os.environ['GITHUB_REPOSITORY']
    source = event.get('workflow_run')
    reuse = os.environ.get('REUSE_RUN', '')
    is_waiting = False
    if source:
        pull_list = api(f'repos/{repository}/commits/{source["head_sha"]}/pulls')
    elif os.environ['GITHUB_EVENT_NAME'] == 'push':
        pull_list = api(f'repos/{repository}/commits/{os.environ["GITHUB_SHA"]}/pulls')
    else:
        pull_list = []
    merged = [pull for pull in pull_list if pull['merged_at'] and pull['base']['ref'] == 'main']
    if source and not merged:
        is_waiting = True
    for pull in merged:
        if source and source['head_sha'] != pull['head']['sha']:
            continue
        runs = api(f'repos/{repository}/actions/workflows/package-builds.yml/runs?head_sha={pull["head"]["sha"]}&per_page=100')['workflow_runs']
        if not runs:
            continue
        run = verification_run(runs)
        is_waiting = run['status'] != 'completed'
        if not is_waiting:
            reuse = str(run['id'])
        break
    with open(os.environ['GITHUB_OUTPUT'], 'a') as output:
        output.write(f'reuse-run={reuse}\nwaiting={str(is_waiting).lower()}\n')
        if source and merged:
            pull = next((pull for pull in merged if pull['head']['sha'] == source['head_sha']), None)
            if pull:
                output.write(f'base={pull["merge_commit_sha"]}^\n')


if __name__ == '__main__':
    main()
