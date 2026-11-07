return {
    name = "topgrade",
    description = "Update installed tools and packages",
    homepage = "https://github.com/topgrade-rs/topgrade",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "topgrade-rs/topgrade",
        repository_id = 549714010,
        tag = "v{version}",
    },
    prebuilt = {
        github = "topgrade-rs/topgrade",
        tag = "v{version}",
        asset = "topgrade-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "topgrade" },
        checks = {
            { "topgrade", "--version" },
            { "topgrade", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "17.15.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.15.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.15.0",
        },
    },
    versions = {
        ["17.14.1"] = {
            digests = {
                ["aarch64-linux"] = "3529722b56a2bb0e95cbfcbb74b28f2ee96b48ebbd44a958081891b074d6859a",
                ["aarch64-macos"] = "c9552341e53a9e6a2ec1f2c270d8a14d8154f352ee384ba68e065550da08ca72",
                ["x86_64-linux"] = "04e9896bb55a36b9232532c7f7f701392fc2169ddf91155a353440198c07e278",
            },
        },
        ["17.15.0"] = {
            digests = {
                ["aarch64-linux"] = "cd673cfa391fc7e4146bd30e4281f34b51464d68af4b4585cc01eafa79ca446f",
                ["aarch64-macos"] = "33f47f55f1834576f105847aefc3c29b8c5f283d0f7fcf83bff3aef700fe1881",
                ["x86_64-linux"] = "8f0f2ae561e96ad3d4d8775d19fdfbfe4f1dc5e4ad678ab3bfb24a1ce5c8b696",
            },
        },
    },
}
