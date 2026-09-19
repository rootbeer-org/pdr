import gzip
import hashlib
import json
import os
from pathlib import Path
import shutil
import subprocess
import tarfile

root = Path('.cache-fixture').resolve()
root.mkdir(exist_ok=True)
source = root / 'source'
source.mkdir(exist_ok=True)
counter = root / 'compilations'
transient = root / 'transient-failure'
is_retry = int(os.environ['GITHUB_RUN_ATTEMPT']) > 1
if is_retry:
    transient.unlink(missing_ok=True)
    counter.unlink(missing_ok=True)
else:
    transient.touch()
(source / 'configure').write_text(f'''#!/bin/sh
echo built >> "{counter}"
cat > Makefile <<'MAKE'
all:
\ttrue
check:
\ttrue
install:
\tmkdir -p $(DESTDIR)/bin
\tprintf '#!/bin/sh\\n[ "$$1" != "--transient" ] || [ ! -f "{transient}" ]\\n' > $(DESTDIR)/bin/tool
\tchmod +x $(DESTDIR)/bin/tool
MAKE
''')


def normalize(member):
    member.mtime = member.uid = member.gid = 0
    member.uname = member.gname = ''
    member.mode = 0o755 if member.isdir() else 0o644
    return member


archive = root / 'source.tar.gz'
with archive.open('wb') as output, gzip.GzipFile(filename='', fileobj=output, mode='wb', mtime=0) as compressed:
    with tarfile.open(fileobj=compressed, mode='w') as bundle:
        bundle.add(source, arcname='source', filter=normalize)
digest = hashlib.sha256(archive.read_bytes()).hexdigest()
# Supply the unavailable test source; recovery itself treats the cache as opaque.
downloads = Path('.package-results/builds/downloads')
downloads.mkdir(parents=True, exist_ok=True)
shutil.copyfile(archive, downloads / f'sha256-{digest}')
packages = root / 'packages'
packages.mkdir(exist_ok=True)
for name, check in [('good', '--version'), ('retry', '--transient')]:
    (packages / f'{name}.lua').write_text(f'''return {{
      schema = 2, name = "{name}", description = "Failed package recovery", homepage = "https://example.invalid",
      default_version = "1", systems = {{ "aarch64-macos", "aarch64-linux", "x86_64-linux" }},
      inputs = {{ source = {{ url = "https://example.invalid/source.tar.gz", archive = "tar.gz", strip_prefix = "source" }} }},
      build = {{ backend = "autotools" }},
      outputs = {{ bins = {{ "tool" }}, checks = {{ {{ "tool", "{check}" }} }} }},
      versions = {{ ["1"] = {{ inputs = {{ source = {{ sha256 = "{digest}" }} }} }} }},
    }}''')
command = [os.environ['ROOTBEER_FORGE'], '--catalog', str(packages), 'export', '--registry', 'owner/index',
           '--cache', '.package-results', '--cache-context', os.environ['CACHE_CONTEXT'], '--jobs', '1']
plan = root / 'plan.json'
subprocess.run([*command, '--plan', '--output', str(plan)], check=True)
decisions = json.loads(plan.read_text())['packages']
assert decisions['retry@1']['action'] == 'qualify', decisions
assert decisions['good@1']['action'] == ('reuse' if is_retry else 'qualify'), decisions
result = subprocess.run([*command, *([] if is_retry else ['--recheck']), '--output', str(root / 'result')])
if not is_retry:
    assert result.returncode != 0, 'first attempt must fail the transient package check'
    assert len(counter.read_text().splitlines()) == 2
    print('Intentional first-attempt failure; completed good package must be saved by Actions.', flush=True)
    raise SystemExit(1)
assert result.returncode == 0
assert len(counter.read_text().splitlines()) == 1, 'retry must build only the failed package'
index = json.loads((root / 'result/index.json').read_text())
artifact = next(iter(index['artifacts']['good@1'].values()))
assert artifact['receipt_sha256'] == decisions['good@1']['receipt_sha256']
print('Native cache retry reused the original good receipt and built only the failed package.')
