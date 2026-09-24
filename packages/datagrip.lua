return {
    name = "datagrip",
    description = "Query and manage databases in a JetBrains IDE",
    homepage = "https://www.jetbrains.com/datagrip/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://download.jetbrains.com/datagrip/datagrip-2026.2.5-aarch64.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["DataGrip.app"] = "DataGrip.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2026.2.5+262.10315.132",
        },
    },
    versions = {
        ["2026.2.5+262.10315.132"] = {
            digests = {
                ["aarch64-macos"] = "f4c85cb1a1973764f84184c5fb8e4b86c7fac9aae2731e503f6f331b1217ddc8",
            },
        },
    },
}
