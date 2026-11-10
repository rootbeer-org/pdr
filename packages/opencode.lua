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
            default_version = "2.2.6",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.2.6",
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
            default_version = "2.2.6",
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
        ["2.2.6"] = {
            digests = {
                ["aarch64-linux"] = "f2d27600c367e45057d6a16f6a5c2aa8d77b41a9b10d4bc3d849c2f88870e944",
                ["aarch64-macos"] = "15491608f6b0bc4debe5eac35eab629a2b07ea9a1fbac68ad53bcea59fcc4b45",
                ["x86_64-linux"] = "08bb21d6326ce740d91cce7ebe88a6536933f6e1e30353b91a06b01f25da306c",
            },
        },
    },
}
