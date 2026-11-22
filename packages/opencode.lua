return {
    name = "opencode",
    description = "AI coding agent for the terminal",
    homepage = "https://opencode.ai",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "anomalyco/opencode",
        repository_id = 975734319,
        tag = "v{version}",
    },
    prebuilt = {
        github = "anomalyco/opencode",
        tag = "v{version}",
        asset = "opencode-{target}",
    },
    outputs = {
        bins = { "opencode" },
        checks = {
            { "opencode", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64.tar.gz",
            default_version = "2.3.2",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.3.2",
            prebuilt = {
                github = "anomalyco/opencode",
                tag = "v{version}",
                asset = "opencode-{target}",
                dependencies = {
                    { package = "rb-unpack", kind = "build" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "linux-x64-baseline.tar.gz",
            default_version = "2.3.2",
        },
    },
    versions = {
        ["2.3.0"] = {
            digests = {
                ["aarch64-linux"] = "3207fb5cdec448d479242c0f1a14f4f7bdfcad3a79209b5eb8f9003725e93711",
                ["aarch64-macos"] = "7907df2b12720a840fbb49c5b978b9b82925b6bf75479a5fd216afa8932b6702",
                ["x86_64-linux"] = "fc0f81522aceeabac47693d88389efa2bc517ce74c2c38fd6967819fcc6e4d3b",
            },
        },
        ["2.3.2"] = {
            digests = {
                ["aarch64-linux"] = "9d10185acdb72336e086e699ca363a6065f410fd3c1caed0dc8046e95ac06ccb",
                ["aarch64-macos"] = "31ab5a06a29edc7e49b895f35c2b64ebfe7c7f0437b0f2581b006efcd79fee1a",
                ["x86_64-linux"] = "563b5d663637226b6e3bb4bb6803281bc39b0d2cd88db06d674b6420aab009b0",
            },
        },
    },
}
