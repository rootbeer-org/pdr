return {
    schema = 2,
    name = "orbstack",
    description = "Replacement for Docker Desktop",
    homepage = "https://orbstack.dev/",
    default_version = "2.2.3+20963",
    inputs = {
        prebuilt = {
            url = "https://cdn-updates.orbstack.dev/arm64/OrbStack_v2.2.3_20963_arm64.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["OrbStack.app"] = "OrbStack.app",
        },
    },
    versions = {
        ["2.2.3+20963"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "7ca77868f3a0d7d9f57b3f98615aad30cc59d23cc84bbff13f78846df0b493d4",
                    },
                },
            },
        },
    },
}
