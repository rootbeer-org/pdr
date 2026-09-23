return {
    name = "choose",
    description = "Select fields and ranges from text",
    homepage = "https://github.com/theryangeary/choose",
    default_license = "GPL-3.0",
    upstream = {
        github = "theryangeary/choose",
        repository_id = 207951619,
        tag = "v{version}",
    },
    prebuilt = {
        github = "theryangeary/choose",
        tag = "v{version}",
        asset = "choose-{target}",
    },
    outputs = {
        bins = { "choose" },
        checks = {
            { "choose", "--version" },
            { "choose", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "1.3.7",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.3.7",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.3.7",
        },
    },
    versions = {
        ["1.3.7"] = {
            digests = {
                ["aarch64-linux"] = "0db1d789ededcedd2c56222eb28f45d5e5e1c56717c0ba5d26c780696bbe3420",
                ["aarch64-macos"] = "ba89bf6b9bc180e452699cd33e324407f03c9e081f7894f34b4d17fba1ea74d6",
                ["x86_64-linux"] = "f9958b15b9c5e2ed21162dcd21e514b51a03efc8dcbf730546c3dbef8a2eba2a",
            },
        },
    },
}
