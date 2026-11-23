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
            trees = {
                ["aarch64-linux"] = "02806de0d224f9a234b7bd8b423e934e6fec3ae0cd9411eea7a429e9593195c2",
                ["aarch64-macos"] = "bb3c7b3c000211ca57177d8f7cadddaa6bddbcc6bfe7298b4f118aa19bd8eff5",
                ["x86_64-linux"] = "0e4fca10a49417c3deaa55a8a67ce1127ae24201c1319dd88727ba33b2711ef4",
            },
        },
        ["2.3.2"] = {
            digests = {
                ["aarch64-linux"] = "9d10185acdb72336e086e699ca363a6065f410fd3c1caed0dc8046e95ac06ccb",
                ["aarch64-macos"] = "31ab5a06a29edc7e49b895f35c2b64ebfe7c7f0437b0f2581b006efcd79fee1a",
                ["x86_64-linux"] = "563b5d663637226b6e3bb4bb6803281bc39b0d2cd88db06d674b6420aab009b0",
            },
            trees = {
                ["aarch64-linux"] = "c4341811954a49db4e341aa25345abdc06d6133ef2a5ea2f8fdb69f66b6e5dd3",
                ["aarch64-macos"] = "0c0746d601a52ee83974abed94ba0e05146c22ae6448e1cd851f1bedc0fcc120",
                ["x86_64-linux"] = "ad4aff9eea7f0ad3ba443583b2329e5e2152145da55f3d3fdafc344a64bac1ce",
            },
        },
    },
}
