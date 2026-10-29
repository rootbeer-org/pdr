return {
    name = "opencode",
    description = "Run an AI coding agent in the terminal",
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
            default_version = "2.2.1",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.2.1",
            prebuilt = {
                github = "anomalyco/opencode",
                tag = "v{version}",
                asset = "opencode-{target}",
                dependencies = {
                    { package = "7zip", kind = "build" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "linux-x64-baseline.tar.gz",
            default_version = "2.2.1",
        },
    },
    versions = {
        ["1.19.4"] = {
            digests = {
                ["aarch64-linux"] = "8568230ccd847dc93e95b9f6894379077d3e014a16b48040743573e77c23e85f",
                ["aarch64-macos"] = "c400a2f8c8ab7e99478a7f4dd1a466b57bf33888e520d85c55780a5464c4b689",
                ["x86_64-linux"] = "1697ef40558d378bd2f72efa8fafe1bed1f0e664f09247b9357556b95dbc7cbc",
            },
        },
        ["2.2.1"] = {
            digests = {
                ["aarch64-linux"] = "c354d8a2dc4152308bf286b5ec7f20b3b3cfc71f9476e64f6aa274142505b2f8",
                ["aarch64-macos"] = "9df6ca3d031565c61080c717374ba846d238ec5b1c411eebe6b1b85835998ffe",
                ["x86_64-linux"] = "3179551ddf69877ca24a960b0175e94405cf3f52147f1eec705094374bef49f2",
            },
        },
    },
}
