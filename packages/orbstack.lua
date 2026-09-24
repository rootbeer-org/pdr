return {
    name = "orbstack",
    description = "Run Docker containers and Linux machines on macOS",
    homepage = "https://orbstack.dev/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://cdn-updates.orbstack.dev/arm64/OrbStack_v2.2.3_20963_arm64.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["OrbStack.app"] = "OrbStack.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2.2.3+20963",
        },
    },
    versions = {
        ["2.2.3+20963"] = {
            digests = {
                ["aarch64-macos"] = "7ca77868f3a0d7d9f57b3f98615aad30cc59d23cc84bbff13f78846df0b493d4",
            },
        },
    },
}
