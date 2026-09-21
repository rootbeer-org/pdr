# Rootbeer index

This repository owns package recipes, discovery, verification, and publication.
Recipes live in `packages/*.lua`; engine code and its tests live in `rootbeer`.
Changes target main. Commit or push only when the user asks.

Adding packages should require one verification pass per supported platform.
Finish recipe edits and run `rootbeer-forge --catalog packages check` before CI.
Inspect existing runs, cached results, and artifact promotion eligibility before
starting another build. Build only new or affected inputs, reuse unaffected results,
and publish the verified PR artifacts after merge. Do not warm caches with baseline
builds, duplicate CI with a full local export, or rebuild successful jobs to retry
failures. Full requalification is for scheduled or explicitly requested rechecks.
If reuse fails, diagnose the cause rather than routinely starting over. Preserve
integrity and provenance checks. While waiting, check CI at meaningful intervals;
read failed-job logs when actionable instead of repeatedly fetching unchanged output.

Use schema 2 recipes with canonical lowercase names and exact upstream versions.
Keep discovery in `upstream`, downloads and verified hashes in `inputs`, build settings
in `build`, and exports and checks in `outputs`. Each source version owns its hash
at `versions[version].inputs.source.sha256`. Never edit generated indexes. Increment
revisions for changed recipes; shared-field edits must account for retained versions
through overrides or revision bumps. Compare expanded `rootbeer-forge --catalog
packages index` output to confirm the scope of recipe changes.

Choose the newest supported upstream release for each platform, using
`default_versions` when they differ. Retain older versions for existing locks.
Declare only platforms CI can verify. Source-capable recipes publish our compiled
outputs; upstream prebuilts do not replace declared source builds. Verify Git-source
build steps against repository archives before declaring `inputs.source.git`.

Keep `package-engine-revision` pinned to a full commit SHA. Change it only when required by
engine-dependent recipes or workflows, coordinating schema changes with the engine.
Unrelated engine changes should not force catalog-wide rebuilds; fix overly broad
invalidation when necessary. Never expose publication credentials to build or PR
jobs. Publication needs a usable source recipe or verified artifact for every
version and platform; binary-only recipes need complete artifacts. Preserve retained
snapshots, receipts, and OCI manifests required by existing lockfiles.
