return {
    name = "zoxide",
    description = "Navigate frequently used directories",
    homepage = "https://github.com/ajeetdsouza/zoxide",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "ajeetdsouza/zoxide",
        repository_id = 245166720,
        tag = "v{version}",
    },
    prebuilt = {
        github = "ajeetdsouza/zoxide",
        tag = "v{version}",
        asset = "zoxide-{version}-{target}.tar.gz",
    },
    outputs = {
        bins = { "zoxide" },
        checks = {
            { "zoxide", "--version" },
            { "zoxide", "init", "zsh" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.10.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.10.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.10.0",
        },
    },
    versions = {
        ["0.10.0"] = {
            digests = {
                ["aarch64-linux"] = "f1f16c5d6298d63dee467eedea1cdcd8490e43e493bea43acd416dc9033ef641",
                ["aarch64-macos"] = "b55ae6f2f5f23d0a6ccb3bd4eeb2af9c7e0a6556e5255c82100e40305129bbb0",
                ["x86_64-linux"] = "2d93385b99f3e82cf2701609a1bffcad863fbeb75aa3fe7eb6be4d29be68b1ae",
            },
            revision = 2,
        },
    },
}
