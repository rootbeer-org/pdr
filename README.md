# Rootbeer package index

Packages for [Rootbeer](https://rootbeer.tale.me), with package recipes
for Apple silicon macOS and Linux on ARM64 and x86-64. Availability varies by package.

[Browse packages](https://rootbeer.tale.me/packages/) ·
[Install Rootbeer](https://rootbeer.tale.me/guide/getting-started) ·
[Package guide](https://rootbeer.tale.me/guide/packages)

## Use a package

Run a tool without creating a Rootbeer configuration:

```sh
rb run jq -- --version
```

Keep it available for everyday use:

```sh
rb use jq
eval "$(rb env)"
jq --version
```

Add `@version` to request an exact release, such as `jq@1.8.2`. You can also manage
packages alongside your dotfiles with `rb.package("jq")` in your Lua configuration.
Rootbeer normally installs published binaries. Source-capable packages are built by
our index CI; binary-only packages use upstream releases.

Packages can also export macOS apps: `rb use bobrwm` links `Bobrwm.app` into
`~/Applications`. Existing apps are never overwritten. `rb unuse bobrwm` removes
the user installation, retaining the app link if your Lua configuration still needs it.
For an existing Bobrwm installation, run `rb update`, then `rb use bobrwm --update`.

Run `rb update` on supported platforms to use the active `current.json` catalog.
Intel macOS is unsupported; its retired binary and frozen catalog channel are no longer
served. Published snapshots, receipts, and archives remain available for existing locks.

## Contribute a package

Recipes live in [`packages/`](packages/), one schema 2 Lua file per tool. Start with an
existing recipe such as [`jq.lua`](packages/jq.lua), then follow the
[package authoring guide](https://rootbeer.tale.me/contributing/packaging).

- Use the canonical lowercase name and exact upstream versions.
- Separate `upstream` discovery, `inputs`, optional `build`, and `outputs`.
- Keep source hashes in each version's `inputs.source.sha256`. Prebuilt-only
  packages require no build definition.
- Declare only platforms you can verify, with checks that exercise the tool.
- Keep older versions. Increment the revision when changing an existing recipe.
- Review shared settings carefully: changes can affect every retained version.

From this repository, validate the catalog and test packages for your platform:

```sh
rootbeer-forge --catalog packages check
rootbeer-forge --catalog packages export --registry tale/rootbeer-index --output result --workers 2 --jobs 2
```

Use Forge from the commit in `engine-revision` and a new output directory. Export
downloads or builds packages and runs their declared checks, so it requires network
access and can take time. Open a pull request with the recipe changes; CI verifies all declared
platforms before publication.

The [upstream discovery workflow](.github/workflows/discovery.yml) checks for new
releases daily and automatically promotes candidates after verification on every
supported platform. Publication checks artifact digests and catalog equality, commits
updated recipes, and publishes the exact verified bundle without rebuilding. Stale
catalog or pipeline inputs prevent promotion; subsequent scans retry using cached
results. Packages without discovery rules remain visible as untracked.

Rootbeer updates also run every 15 minutes, or immediately when successful Rootbeer
CI pushes the `rootbeer-update` request file (repository dispatch is also supported). Only successful main commits are
eligible; older recipes remain pinned. Configure `INDEX_UPDATE_SSH_KEY` in `tale/rootbeer`
with a writable deploy key scoped to this repository to enable immediate notification. Polling
works without it. `PUBLISH_INDEX` controls both automatic promotion and publication;
main must allow the workflow token to push verified recipe updates.

## Report a problem

For a missing tool, broken package, or outdated version, [open an issue here](https://github.com/tale/rootbeer-index/issues).
Include the package, requested version, platform, and error output when applicable.
For problems with `rb` itself, use the [Rootbeer repository](https://github.com/tale/rootbeer/issues).

## Maintenance

This repository owns package discovery, build checks, and publication. The engine
repository owns the tools and their regression tests.

The [verification workflow](.github/workflows/packages.yml) qualifies recipes; the
[publication workflow](.github/workflows/publish.yml) publishes the signed index
using `rootbeer-forge`. The exact engine commit lives in
[`engine-revision`](engine-revision); changing it runs package CI and discovery.
Update the pin together with any required recipe or workflow migrations.

Each of three platform jobs builds its engine and exports with two package workers,
sharing a compiler job budget detected from the runner's CPU count. Dependencies
run before consumers; independent source builds can overlap. Shared dependencies
compile once per export, including full rechecks.

Cache identities separate the four backend implementations from shared build
behavior. A Rust backend edit changes Rust compilation and any qualification whose
dependency closure uses Rust; independent C results remain reusable. Shared or
unclassified build code, manifests, the workspace lockfile, and runner-image changes
still invalidate conservatively. Rust toolchain identity is recorded by Forge for
Rust closures, not injected into every platform cache context.

Verified results are cached by engine inputs and build environment, including
successful work from failed runs. Compatible results survive unrelated engine
commits. PR caches remain scoped to that PR and support its retries; main's caches
also seed new PRs. Approved OCI candidates can seed an empty cache independently
of Actions cache retention. Scheduled full checks refresh qualification evidence.

Actions saves the opaque Forge cache after successful or failed verification.
Retries restore the current run's most recent cache in the same runner environment.
An explicit recheck uses a run-specific namespace, so older results cannot satisfy
it; retries reuse only work completed within that recheck. Cache contents and their
validation belong to Forge. Workflows do not parse or rewrite cache entries.

Caches are temporary and may be evicted. A retry without retained results stops
for investigation rather than silently restarting completed builds. Cancelled jobs
or jobs that time out before saving may lose their latest work. Approved complete
candidates remain in OCI independently of the Actions cache.

Each platform emits `package-plan-<runner>-<attempt>` with Forge's JSON decisions
and adds reuse/qualification counts to the job summary. Verified bundles remain
in Actions artifacts for 14 days; the collector retains complete candidates in
OCI before those artifacts expire. PR caches remain isolated from main.

Package updates are independent of Rootbeer binary
releases. See [index hosting and trust](https://rootbeer.tale.me/contributing/package-hosting)
for deployment and client verification details.

Retain published snapshots, receipts, and package archives: existing lockfiles
still depend on them.

## Source alternatives

Source-capable packages prefer binaries compiled from our recipes by index CI
and can also be built locally:

```sh
rb use jq --source
rb use zlib --head
rb use zlib --tag v1.3.2
```

HEAD and tags resolve to exact commits in the package lock. Normal installs reuse
that lock; `--update` resolves the reference again. Recipes opt into Git builds
with `inputs.source.git`. Binary-only packages remain supported regardless of
license and reject source selectors.

## Build verification and publication

Pull requests run package verification without publishing credentials. A separate
[collector](.github/workflows/retain-results.yml) checks out trusted main, builds
its own pinned Forge, and admits only unchanged verification tooling from
same-repository PRs or allowed main events. It checks successful assembly, GitHub
artifact digests, complete qualifications, and catalog equality. Source Git objects
are read as data; uploaded executables are never run by the collector or publisher.
Fork results require a same-repository verification run before admission.

The collector stores raw files in `ghcr.io/tale/rootbeer-index/results` and attests
the resulting OCI digest. `sha256-<digest>` tags retain immutable candidates;
`catalog-<digest>` and `collector-<run>-<attempt>` tags are locators only. Readers
resolve a locator once, verify the main collector's attestation, and consume exact
content by digest. Keep these images and their OCI attestation referrers indefinitely.
Actions artifacts can then expire without preventing publication.

Publication matches that candidate to the approved catalog and engine pin, checks
that main has not advanced, and signs the existing bundle. Discovery promotion uses
its retained report and recipes. Publication adds a separate catalog-approval
attestation and advances `accepted`. Builds import only candidates with both the
collector and publication attestations. Registry write/signing credentials remain
in separate trusted jobs. Qualification keys still decide per-package reuse;
importing evidence never executes package code. For cache seeding, the reader first
fetches authenticated index/qualification metadata and asks Forge's `candidate-files`
command for the current platform's receipts and runtime archives. Only those blobs
are downloaded and imported with `--system`. Full publication still requires every
platform's contents; a partial transfer cannot satisfy its verification gate.

Automatic publication with missing evidence waits for collection or repair; it
never falls back to a catalog build. A manual publication may qualify missing
inputs using compatible caches. Scheduled runs and manual `recheck` explicitly
requalify everything. A changed engine pin requires a candidate from that pin;
unrelated engine changes still reuse qualifications through Forge's semantic
engine identity. Changed verification tooling must land on main before producing
admissible evidence.

### Rollout and recovery

1. Push the engine commit, then this repository's matching `engine-revision`.
2. Run the branch-only [retention fixture](.github/workflows/candidate-fixture.yml).
   It builds one synthetic package on Linux x86-64 and ARM64, assembles and attests
   it under the separate `ci-fixture` image, then downloads only x86-64 contents into
   an empty cache. It checks exact bytes, skipped foreign blobs, no rebuild, and
   rejection of that partial bundle by the complete-publication gate.
   Production admission must reject its branch signer. No catalog jobs run.
3. After review and merge, retain and publish a candidate with the new engine.
   Existing bundles without qualification records cannot be upgraded from archives.
   Inspect caches and Forge plans before explicitly requesting missing verification.
4. Set repository variable `DURABLE_PACKAGE_RESULTS=true` after the `results` image
   and its first approved `accepted` candidate exist. Before this switch, cross-run
   OCI seeding is disabled; collectors and publication from their events still work.
   Allow Actions read access to this package (including PR jobs), or make it public.

If only fixture retention fails, dispatch `candidate-fixture.yml` on the feature
branch with `source-run` set to the completed producer run. Its build jobs are
skipped and the existing fixture artifacts are reused. Dispatch with `cache-retry=true`
to test failed-package recovery independently. Its first attempt deliberately fails
after one package succeeds; rerun the failed job to verify that only the failed
package builds and the successful receipt stays identical.

A failed collection can be rerun while producer artifacts remain available. A
failed publication retries the same digest; it does not rebuild. If main advanced,
select evidence for the current catalog instead of replaying an older release.
If evidence expired before collection, recover it from compatible caches and explicitly qualify only missing inputs. Digest, attestation,
and authentication failures are errors, never cache misses.
