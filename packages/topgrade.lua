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
            default_version = "17.17.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.17.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.17.0",
        },
    },
    versions = {
        ["17.16.0"] = {
            digests = {
                ["aarch64-linux"] = "fae8eb3465506c2bb64838a3f0681b0d286bf3c569e3bc928076e57ed2f4d865",
                ["aarch64-macos"] = "fad921f24b445a7a1b07db99ed7a034e9f389bc540202d401bfc65215d641009",
                ["x86_64-linux"] = "70cc59701662fecf3757156a7ba8e6cc5f249d77473b5d58557178519d86a8ca",
            },
        },
        ["17.17.0"] = {
            digests = {
                ["aarch64-linux"] = "10cccced7dd5bf1f27cbc7b8b333ea5f7bbbf818290b0a2452aa947f4dd01c08",
                ["aarch64-macos"] = "8954d5ab7f559420be7cf4c6b4f10145abdb84e16d47d0379d42aa9c89de592b",
                ["x86_64-linux"] = "41c3e9e79ae7274461bad910401545250ffca1240805a55266270ef0af85c313",
            },
        },
    },
}
