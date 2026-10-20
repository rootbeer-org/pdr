# Rootbeer index

This repository owns package recipes and the CI that builds and publishes them.
Recipes live in `packages/*.lua`, and engine code and its tests live in `rootbeer`.
Changes target main. Commit or push only when the user asks.

`ci.yml` plans every declared version against `ghcr.io/rootbeer-org/store` with the
`rb` pinned in `.github/rb-engine-revision`, and builds only what the store lacks.
PRs build and check. Pushes to main publish and ask `rootbeer-org/index` to sign.
`rootbeer.yml` moves the pin and the rootbeer recipe together to each commit
rootbeer's CI publishes. By hand, pin only a pushed, CI-green rootbeer commit.

Verify recipe changes locally before CI.

- macOS: `rb drv build <pkg> --host host.local.lua`, where `host.local.lua` names
  this machine's toolchain and is excluded from git.
- Linux arm64: `RB_CATALOG=<this checkout> scripts/linux.sh build <pkg>` from
  rootbeer.
- After edits, `RB_CATALOG=<this checkout>/packages cargo test -p rootbeer-eval
  --test corpus -- --ignored` from rootbeer evaluates every target.

Use canonical lowercase names and exact upstream versions. Retain older versions,
since locks pin them. Shared fields apply to every retained version and rekey it,
so give a build change to one version as an override on that version. Changing
`host.lua`'s `system` rekeys every source build on that platform. Declare only
platforms CI can verify. Fix scan failures in the recipe, or acknowledge a host
reference in `outputs.host` with a why comment.
