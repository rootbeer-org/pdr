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
            default_version = "1.18.35",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "1.18.35",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-baseline.tar.gz",
            default_version = "1.18.35",
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
        ["1.18.34"] = {
            digests = {
                ["aarch64-linux"] = "bbdb3f00c2c51e42e315525233151309724226a8776da8e9145e3b0fa3d5310f",
                ["aarch64-macos"] = "8522b70f545184b3a8d97c5ca4f814093b2476d72aebfda8c48bcd072ec31d1b",
                ["x86_64-linux"] = "24b0d458d21ef548b2752166303defcf7f4945b049fb4876ab78dfaf86d81b27",
            },
        },
        ["1.18.35"] = {
            digests = {
                ["aarch64-linux"] = "f7f2ba59ee8aa94d388f9696575a32d20e71c2ee48def9f80fc693a60fec6c72",
                ["aarch64-macos"] = "80b05124357a77cd57945bfde36082a028e829c198d222d5e146617f49a2c4b7",
                ["x86_64-linux"] = "90c97d4a24d36437bce36f27195c9cd2e0b70ed037a04d1c6a6740eb246c2a73",
            },
        },
    },
}
