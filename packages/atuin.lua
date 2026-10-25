return {
    name = "atuin",
    description = "Search and sync shell history",
    homepage = "https://atuin.sh/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "atuinsh/atuin",
        repository_id = 301244405,
        tag = "v{version}",
    },
    prebuilt = {
        github = "atuinsh/atuin",
        tag = "v{version}",
        asset = "atuin-{target}.tar.gz",
    },
    outputs = {
        bins = { "atuin" },
        checks = {
            { "atuin", "--version" },
            { "atuin", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "18.24.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.2",
        },
    },
    versions = {
        ["18.24.1"] = {
            digests = {
                ["aarch64-linux"] = "a63e649138cddd5c9dba7123c89c2488b1701027d432836553a8a6cf51f5e863",
                ["aarch64-macos"] = "0094caaa5732ea404ff9057e87a6ef1eb45a7317433bc3a6b06c3adf0546e891",
                ["x86_64-linux"] = "fe03f652d6545a9d8795b3c2abb84bcddfe831e4b7effb0c2d191a0d70e498a0",
            },
        },
        ["18.24.2"] = {
            digests = {
                ["aarch64-linux"] = "9addf06ece26e68e842489cefa33e81860c288da373538986ea58c23eccb4f14",
                ["aarch64-macos"] = "ba155cb61385e424c972ba5cadab68add2c6ad0d4f842365fc958d7a5f5917d5",
                ["x86_64-linux"] = "311cd1ba4b8be27de7071dbcae1c95ff4c2b38aeec82d557707b6b832bfceddf",
            },
        },
    },
}
