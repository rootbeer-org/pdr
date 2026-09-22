"""Project an expanded catalog into one resolved contract per package/version/system.

The projection is stable across recipe-schema changes, so a refactor can be verified by
diffing its output before and after. Reads `rootbeer-forge --catalog <dir> index` on stdin.
"""

import hashlib
import json
import sys


def resolved(recipe, system):
    """The contract a platform actually builds: its override, else the shared recipe.

    System-keyed maps are resolved to this system's entry, and fields that moved from
    the recipe to the version it belongs to fall back, so the projection survives a
    recipe moving from shared maps to per-platform contracts.
    """
    contract = recipe.get("platforms", {}).get(system, recipe)
    fields = {
        key: contract.get(key)
        for key in ("source", "install", "build", "apps", "checks", "mirror")
    }
    fields["revision"] = contract.get("revision") or recipe.get("revision")
    fields["checks"] = contract.get("checks") or []
    bins = contract.get("bins")
    if isinstance(bins, dict):
        fields["bins"], fields["bin_paths"] = sorted(bins), bins
    else:
        fields["bins"], fields["bin_paths"] = bins or [], contract.get("bin_paths")
    fields["asset"] = contract.get("asset") or (contract.get("assets") or {}).get(system)
    fields["checksum"] = contract.get("sha256") or (contract.get("checksums") or {}).get(system)
    return fields


def main():
    catalog = json.load(sys.stdin)
    for name, package in sorted(catalog["packages"].items()):
        for version, recipe in sorted(package["versions"].items()):
            systems = set(recipe.get("systems", [])) | set(recipe.get("platforms", {}))
            for system in sorted(systems):
                contract = json.dumps(resolved(recipe, system), sort_keys=True, separators=(",", ":"))
                digest = hashlib.sha256(contract.encode()).hexdigest()[:16]
                print(f"{name}@{version} {system} {digest}")


if __name__ == "__main__":
    main()
