return {
    name = "orbstack",
    description = "Run Docker containers and Linux machines on macOS",
    homepage = "https://orbstack.dev/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = {
        sparkle = "https://api-updates.orbstack.dev/arm64/appcast.xml?bucket=99",
        public_key = "nuUHoUatJ4OxpNCGb5NJ7s5WQYBG4iiZ6rm8JCk0sNQ=",
        channel = "stable",
    },
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
            default_version = "2.2.4",
        },
    },
    versions = {
        ["2.2.3+20963"] = {
            digests = {
                ["aarch64-macos"] = "7ca77868f3a0d7d9f57b3f98615aad30cc59d23cc84bbff13f78846df0b493d4",
            },
        },
        ["2.2.4"] = {
            digests = {
                ["aarch64-macos"] = "f0c698e709c99fb3ee87f92c3a0445c6b8f5a10d6a0edd4f4d461925d194b86a",
            },
            prebuilt = {
                url = "https://cdn-updates.orbstack.dev/arm64/OrbStack_v2.2.4_21120_arm64.dmg",
                install = "Dmg",
                mirror = true,
            },
        },
    },
}
