# Rootbeer package distribution

Packages for [Rootbeer](https://rbpkg.com), with package recipes
for Apple silicon macOS and Linux on ARM64 and x86-64. Availability varies by package.

[Browse packages](https://rbpkg.com/packages/) ·
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

Add `@version` to pin an exact release, such as `jq@1.8.2`, and run
`rb use --update` to move to what the index has now. You can also manage packages
alongside your dotfiles with `rb.package("jq")` in your Lua configuration.

Packages can also export macOS apps. `rb use bobrwm` links `Bobrwm.app` into
`~/Applications`, and existing apps are never overwritten.

Packages install into the shared store at `/opt/rb`, only by the digests the signed
[index](https://github.com/rootbeer-org/index) lists. Clients from before `/opt/rb`
read the frozen `https://pdr.rbpkg.com/v3/current.json`, whose last rootbeer moves
them onto `/opt/rb`. Run `rb migrate` once to move what they installed.

## Contribute a package

Recipes live in [`packages/`](packages/), one Lua file per tool. Start with an
existing recipe such as [`jq.lua`](packages/jq.lua).

- Use the canonical lowercase name and exact upstream versions.
- Each version lists its source or asset digest per platform under `digests`.
- Add a version with `rb drv bump <name> <version> --keep 2`. The index keeps every
  version it signed, so a recipe keeps only what CI should still build. Shared fields
  apply to every retained version, so give a build change to one version as an
  override on that version.
- Dependencies name no version, so they follow the dependency's default and an
  update to it rebuilds what uses it, such as a go or openssl fix. Pin a `version`
  only when a recipe needs that exact one.
- Declare only platforms you can verify, with checks that exercise the tool.

Build and check a package locally, with an `rb` from rootbeer at
[`.github/rb-engine-revision`](.github/rb-engine-revision) or newer:

```sh
rb drv build jq
```

## CI and publication

[Packages](.github/workflows/ci.yml) plans every declared version against
`ghcr.io/rootbeer-org/store` and builds only what the store lacks, level by level
on each platform. A failed package holds back only what depends on it.

PRs build and check. Pushes to main build again and publish to the store, then the
[index repository](https://github.com/rootbeer-org/index) signs the new entries
with a key this repository never sees.

[Rootbeer](.github/workflows/rootbeer.yml) packages each commit rootbeer's CI
publishes. It adds the version as the default, moves the engine pin, keeps the
newest three versions, and merges once its checks pass. The index keeps every
version it signed, so trimming loses nothing.

[Updates](.github/workflows/updates.yml) runs `rb drv updates` daily and opens a PR
per package with a newer stable upstream version, written by `rb drv bump` and
keeping two versions. Those PRs wait for review. Recipes without an `upstream`, and
Sparkle ones, are updated by hand.

## Report a problem

For a missing tool, broken package, or outdated version, [open an issue here](https://github.com/rootbeer-org/rootbeer-index/issues).
Include the package, requested version, platform, and error output when applicable.
For problems with `rb` itself, use the [Rootbeer repository](https://github.com/rootbeer-org/rootbeer/issues).
