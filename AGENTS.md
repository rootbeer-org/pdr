# Rootbeer index

Package definitions live in `packages/*.lua`. Use canonical lowercase names and exact upstream
versions. Increment revisions when changing an existing recipe. Do not edit generated
indexes or add hand-written checksums without verifying the upstream bytes.

Run `rootbeer-forge --catalog packages check` and `rootbeer-forge --catalog packages export
--registry tale/rootbeer-index --output result`. Tests for these commands live in
the Rootbeer engine repository. Package discovery, builds, and publication CI belong
here. Pin Forge with the full engine commit SHA in `engine-revision`; update that
file alongside engine-dependent recipe and workflow changes.
Declare only platforms that the workflow can test. Source builds execute trusted
upstream code; never expose publication credentials to build or pull-request jobs.

Changes target main. Do not commit or push without the user's instruction.
Publication requires a usable source recipe or a published artifact for every
declared version and platform. Prebuilt-only recipes require complete artifacts.
Never remove retained snapshots, receipts, or OCI manifests needed by existing
lockfiles.

Choose the newest upstream release available for each platform. Use
`default_versions` for platforms whose newest supported release differs from
`default_version`; never hold every platform back for one discontinued target.
Keep explicit version requests exact and retain older recipes for existing locks.

Do as little CI work as possible: reuse verified package results when their
recipe, dependency recipes, platform, engine, and build environment are unchanged.
Keep full qualification available for scheduled and explicit rechecks.

Use schema 2 package definitions. Keep release discovery in `upstream`, download
locations and hashes in `inputs`, backend settings in `build`, and exported files
and checks in `outputs`. Prebuilt-only packages have no build section. Use `custom`
for explicit build phases. Each source version owns its hash under
`versions[version].inputs.source.sha256`.

Shared-field changes affect retained versions: use version overrides or increment
each affected recipe revision. Compare expanded `rootbeer-forge --catalog packages
index` output when editing. Schema migrations are coordinated with the engine pin;
legacy authoring formats do not need compatibility adapters.

Source-capable recipes publish our compiled outputs, reusing verified build caches.
Upstream `inputs.prebuilt` is used for binary-only recipes; it does not replace
a declared source build during export or dependency builds. `inputs.prebuilt.systems`
can limit binary coverage; version overrides may disable inherited prebuilts with
`enabled = false`. Declare `inputs.source.git` only after verifying the build steps
against repository archives. HEAD, tags, and branches are resolved to commit SHAs
by consumers; source archive checksums remain separate from Git commit IDs.
