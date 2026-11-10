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
            default_version = "17.16.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.16.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.16.0",
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
        ["17.16.0"] = {
            digests = {
                ["aarch64-linux"] = "fae8eb3465506c2bb64838a3f0681b0d286bf3c569e3bc928076e57ed2f4d865",
                ["aarch64-macos"] = "fad921f24b445a7a1b07db99ed7a034e9f389bc540202d401bfc65215d641009",
                ["x86_64-linux"] = "70cc59701662fecf3757156a7ba8e6cc5f249d77473b5d58557178519d86a8ca",
            },
        },
    },
}
