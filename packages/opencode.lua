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
            default_version = "2.2.3",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.2.3",
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
            default_version = "2.2.3",
        },
    },
    versions = {
        ["2.2.1"] = {
            digests = {
                ["aarch64-linux"] = "c354d8a2dc4152308bf286b5ec7f20b3b3cfc71f9476e64f6aa274142505b2f8",
                ["aarch64-macos"] = "9df6ca3d031565c61080c717374ba846d238ec5b1c411eebe6b1b85835998ffe",
                ["x86_64-linux"] = "3179551ddf69877ca24a960b0175e94405cf3f52147f1eec705094374bef49f2",
            },
        },
        ["2.2.3"] = {
            digests = {
                ["aarch64-linux"] = "72aac82c021268f6cc9810de913f8d47d05626b1ad974d7f5dc5b087e1ad0f68",
                ["aarch64-macos"] = "65db03573e5717e6da245ae3e5c2ffa35915b90689d37c43d4e1ade4d47f55f9",
                ["x86_64-linux"] = "ef3aeeaf5522b10d69a3da7bbd6e6d8d259f845833d96b8310767d3407b18a35",
            },
        },
    },
}
