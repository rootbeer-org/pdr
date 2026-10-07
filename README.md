# Rootbeer package distribution

Packages for [Rootbeer](https://rbpkg.com), with package recipes
for Apple silicon macOS and Linux on ARM64 and x86-64. Availability varies by package.

[Browse packages](https://search.rbpkg.com) ·
[Install Rootbeer](https://rbpkg.com/guide/getting-started) ·
[Package guide](https://rbpkg.com/guide/packages)

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
DMG-backed apps work the same way: `rb use helium kitty` installs their declared app
bundles on Apple silicon macOS. Kitty also exports `kitty` and `kitten`. Qualification
verifies bundle executables and upstream code signatures without opening GUI windows.
PKG installers and apps requiring external signing attributes are not supported yet.

Run `rb update` on supported platforms to use the active `current.json` catalog.
Intel macOS is unsupported; its retired binary and frozen catalog channel are no longer
served. Published snapshots, receipts, and archives remain available for existing locks.

## Contribute a package

Recipes live in [`packages/`](packages/), one schema 2 Lua file per tool. Start with an
existing recipe such as [`jq.lua`](packages/jq.lua), then follow the
[package authoring guide](https://rbpkg.com/contributing/packaging).

- Use the canonical lowercase name and exact upstream versions.
- Separate `upstream` discovery, `inputs`, optional `build`, and `outputs`.
- Keep source hashes in each version's `inputs.source.sha256`. Prebuilt-only
  packages require no build definition.
- Declare only platforms you can verify, with checks that exercise the tool.
- Keep older versions. Increment the revision when changing an existing recipe.
- Review shared settings carefully: changes can affect every retained version.

Validate recipes with Forge from `package-engine-revision`:

```sh
rootbeer-forge --catalog packages check
```

## CI and publication

[Packages](.github/workflows/package-builds.yml) compares expanded recipes and runs
one job per changed package/version/platform. Dependency changes also select their
consumers. Metadata-only changes do not rebuild binaries; unrelated engine updates
do not automatically requalify the catalog.

PR jobs have no signing credentials. After merge, publication admits successful
jobs from the exact merged PR, checks approved verification tooling and input keys,
and promotes immutable artifacts without rebuilding. If a PR is still running when
merged, publication waits for its completion event. Fork PRs use the same path after
approval. A run that never started has no checkpoint requirement.

Each successful package gets its own signing job. Failures do not prevent other
packages from being signed and added to discovery. Existing published versions
remain available while replacements are pending. Retries recover successful work
and run only failed or never-started package jobs. Missing artifacts from a successful
build produce an explicit recovery error.

Signed records and archives live in each package's public GHCR repository.
`https://pdr.rbpkg.com/current.json` is the shared discovery manifest. Forge verifies
signatures and input keys before reuse. Registry errors do not trigger rebuilds.
Keep published records, archives, legacy snapshots, and receipts for existing locks.

Manual publication or recovery:

```sh
gh workflow run package-builds.yml -f packages='fd@10.5.0'
gh workflow run package-builds.yml -f packages='fd@10.5.0' -f reuse-run=RUN_ID
```

An empty selection refreshes discovery without builds. There is no custom concurrency
cap; GitHub's runner quota and 256-entry matrix limit still apply. Split selections
exceeding that matrix limit. New dependency-bearing builds and PKG preparation
remain engine follow-ups; they fail individually without blocking unrelated packages.
Existing published dependency-bearing packages remain installable.

[Upstream discovery](.github/workflows/discovery.yml) proposes recipe changes in a
reviewable PR and explicitly starts per-package verification. It keeps one upstream
update PR open at a time. Merging uses the same artifact promotion path as contributor
PRs. Rootbeer source updates require successful upstream engine CI.

## Report a problem

For a missing tool, broken package, or outdated version, [open an issue here](https://github.com/rootbeer-org/rootbeer-index/issues).
Include the package, requested version, platform, and error output when applicable.
For problems with `rb` itself, use the [Rootbeer repository](https://github.com/rootbeer-org/rootbeer/issues).

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
