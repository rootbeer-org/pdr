return {
    name = "datagrip",
    description = "Query and manage databases in a JetBrains IDE",
    homepage = "https://www.jetbrains.com/datagrip/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://download.jetbrains.com/datagrip/datagrip-2026.3-aarch64.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["DataGrip.app"] = { path = "DataGrip.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2026.3+263.7307.216",
            outputs = {
                host = { "@rpath/libjvm.dylib" },
            },
        },
    },
    versions = {
        ["2026.3+263.7307.216"] = {
            digests = {
                ["aarch64-macos"] = "17201e7bf85313612ba5e7644f8b2293c0fc95137e2e442879f94899df8ec735",
            },
            trees = {
                ["aarch64-macos"] = "bd3e47c9762d6264eb9b05e8e81c8ef0a0db6559121fc4ff6e085093b374ad13",
            },
        },
    },
}
