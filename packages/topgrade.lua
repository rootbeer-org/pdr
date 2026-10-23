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
            default_version = "17.14.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.14.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.14.1",
        },
    },
    versions = {
        ["17.12.2"] = {
            digests = {
                ["aarch64-linux"] = "a762e7161ac1370f77795be4cc483e183b93249db8b58e1ac355bd02a10bb2e3",
                ["aarch64-macos"] = "7d00e60656ff41a95b26e76b63bf4777f7d1272bfa969dbd4669d665629ab7c2",
                ["x86_64-linux"] = "ad6d9ca6932332757f21e4078ae4290cced235f92a4d380df3a250e6da779ca9",
            },
        },
        ["17.14.1"] = {
            digests = {
                ["aarch64-linux"] = "3529722b56a2bb0e95cbfcbb74b28f2ee96b48ebbd44a958081891b074d6859a",
                ["aarch64-macos"] = "c9552341e53a9e6a2ec1f2c270d8a14d8154f352ee384ba68e065550da08ca72",
                ["x86_64-linux"] = "04e9896bb55a36b9232532c7f7f701392fc2169ddf91155a353440198c07e278",
            },
        },
    },
}
