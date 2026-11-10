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
            default_version = "2.2.7",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.2.7",
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
            default_version = "2.2.7",
        },
    },
    versions = {
        ["2.2.6"] = {
            digests = {
                ["aarch64-linux"] = "f2d27600c367e45057d6a16f6a5c2aa8d77b41a9b10d4bc3d849c2f88870e944",
                ["aarch64-macos"] = "15491608f6b0bc4debe5eac35eab629a2b07ea9a1fbac68ad53bcea59fcc4b45",
                ["x86_64-linux"] = "08bb21d6326ce740d91cce7ebe88a6536933f6e1e30353b91a06b01f25da306c",
            },
        },
        ["2.2.7"] = {
            digests = {
                ["aarch64-linux"] = "c1682057f0815cb2abdd6e00305f1146ebaf1c167f0335cdb74ddc80008120e7",
                ["aarch64-macos"] = "811c42be9cad489ea8c411ead49e06f691deee4957ba9a0a56a159a7d6c1abdc",
                ["x86_64-linux"] = "89a6cee227b54bc011179c528a5e63176032462b1a5e21723b616801cddc2ca7",
            },
        },
    },
}
