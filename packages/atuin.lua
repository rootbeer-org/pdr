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
            default_version = "18.24.8",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.8",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.8",
        },
    },
    versions = {
        ["18.24.6"] = {
            digests = {
                ["aarch64-linux"] = "0dcc72a06738f913040cdd990298a37d9ef062c8849026d0a3410d2def4c6bf7",
                ["aarch64-macos"] = "756b7d2f8cb919d29888ea52b2fb19aba92ed52ddbca456839088ccc63257f5b",
                ["x86_64-linux"] = "49b6e7a93cd6d8c77ee02bdb0eef0acff4c80ddaa0efb00c8179285771043698",
            },
        },
        ["18.24.8"] = {
            digests = {
                ["aarch64-linux"] = "e058ab045e9a694e709a23fb87bb55a8737e98dfda9752cb33ea5e9f70c32a13",
                ["aarch64-macos"] = "1c33bb672cf09eecf595578ad3136e415a3e54eb34de92247f637d1fa9eae688",
                ["x86_64-linux"] = "f8dfc3f9d27cadc2e2c9d489394ef7c568291e2382a4d184865701bf1a4ac30a",
            },
        },
    },
}
