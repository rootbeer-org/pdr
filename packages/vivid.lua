return {
    name = "vivid",
    description = "Generate color themes for file listings",
    homepage = "https://github.com/sharkdp/vivid",
    default_license = "Apache-2.0",
    prebuilt = {
        github = "sharkdp/vivid",
        tag = "v{version}",
        asset = "vivid-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "vivid" },
        checks = { { "vivid", "--version" }, { "vivid", "generate", "molokai" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.11.1",
            upstream = { github = "sharkdp/vivid", repository_id = 158295285, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.11.1",
            upstream = { github = "sharkdp/vivid", repository_id = 158295285, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.11.1",
            upstream = { github = "sharkdp/vivid", repository_id = 158295285, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.11.1"] = {
            digests = {
                ["aarch64-linux"] = "99bf6438b3403bc9255a83363fe5ed49a0f8bd86377a561420836af14dc8e9ee",
                ["aarch64-macos"] = "82b23caf7c2fd0adeead0df197c76d5d997c57887a6265e7e63e729daec18570",
                ["x86_64-linux"] = "f1a80a39c75ceae43c4187f302e66c0a45d941ed1479456a0d5ddef665663181",
            },
            revision = 2,
        },
    },
}
