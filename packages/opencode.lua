return {
    name = "opencode",
    description = "Work with coding agents in the terminal",
    homepage = "https://github.com/anomalyco/opencode",
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
            default_version = "1.18.32",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "1.18.32",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-baseline.tar.gz",
            default_version = "1.18.32",
        },
    },
    versions = {
        ["1.18.30"] = {
            digests = {
                ["aarch64-linux"] = "4111a55c2a02c0fac314bd51e9a2330280e6d29d2b85b9554fff6d62612566ed",
                ["aarch64-macos"] = "a5e43d6887386efc7d68ce49ae28e3bbdfdee3dfd1d7169b612c3ce67e53b1e8",
                ["x86_64-linux"] = "60c92147d0d86ca606dda8a77260d3c87e0ef959eb2d8dbffb34df6d8a64e063",
            },
            revision = 2,
        },
        ["1.18.31"] = {
            digests = {
                ["aarch64-linux"] = "d4e332f46b227448582c0d9fc75f6f826dfe95c9f751bc2011fc4d937a042be6",
                ["aarch64-macos"] = "caf7f31fa1aec2353ea859d4ef9ab824c6273d941b016e88d51193fa3028d34e",
                ["x86_64-linux"] = "b283e8dbe9e6fc224bb4b79992ce3bd2174b8b7b0c3e7d1b4e6024a1d11edc84",
            },
        },
        ["1.18.32"] = {
            digests = {
                ["aarch64-linux"] = "568461b7d4d8c19865c97e9a1102e613049c6039d01fe772154de873c1865840",
                ["aarch64-macos"] = "fa643f93401c13508d8d513780e54ce9cc01203d501114be9b88d62408b8101f",
                ["x86_64-linux"] = "763af386ef88a8cab18df00fcf055690e5a55e31a7088beabe02307142a6adce",
            },
        },
    },
}
