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
            default_version = "1.19.4",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "1.19.4",
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
            default_version = "1.19.4",
        },
    },
    versions = {
        ["1.18.34"] = {
            digests = {
                ["aarch64-linux"] = "bbdb3f00c2c51e42e315525233151309724226a8776da8e9145e3b0fa3d5310f",
                ["aarch64-macos"] = "8522b70f545184b3a8d97c5ca4f814093b2476d72aebfda8c48bcd072ec31d1b",
                ["x86_64-linux"] = "24b0d458d21ef548b2752166303defcf7f4945b049fb4876ab78dfaf86d81b27",
            },
        },
        ["1.19.4"] = {
            digests = {
                ["aarch64-linux"] = "8568230ccd847dc93e95b9f6894379077d3e014a16b48040743573e77c23e85f",
                ["aarch64-macos"] = "c400a2f8c8ab7e99478a7f4dd1a466b57bf33888e520d85c55780a5464c4b689",
                ["x86_64-linux"] = "1697ef40558d378bd2f72efa8fafe1bed1f0e664f09247b9357556b95dbc7cbc",
            },
        },
    },
}
