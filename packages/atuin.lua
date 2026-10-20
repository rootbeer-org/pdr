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
            default_version = "18.24.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.1",
        },
    },
    versions = {
        ["18.23.0"] = {
            digests = {
                ["aarch64-linux"] = "faf91adc71e6b661b21ed4f486babbd7af9d17363d4276da4a0251f83c72498d",
                ["aarch64-macos"] = "c988be1cde19cd7295ce64bc8b955d42fb1855e5227cb640c87fc09c8408c3fc",
                ["x86_64-linux"] = "d1b40dd6e7cd3d823867ffe22b39a025bc420f7875926ae9ca974155378da14d",
            },
        },
        ["18.24.1"] = {
            digests = {
                ["aarch64-linux"] = "a63e649138cddd5c9dba7123c89c2488b1701027d432836553a8a6cf51f5e863",
                ["aarch64-macos"] = "0094caaa5732ea404ff9057e87a6ef1eb45a7317433bc3a6b06c3adf0546e891",
                ["x86_64-linux"] = "fe03f652d6545a9d8795b3c2abb84bcddfe831e4b7effb0c2d191a0d70e498a0",
            },
        },
    },
}
