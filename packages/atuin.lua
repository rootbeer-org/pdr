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
            default_version = "18.25.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.25.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.25.0",
        },
    },
    versions = {
        ["18.24.8"] = {
            digests = {
                ["aarch64-linux"] = "e058ab045e9a694e709a23fb87bb55a8737e98dfda9752cb33ea5e9f70c32a13",
                ["aarch64-macos"] = "1c33bb672cf09eecf595578ad3136e415a3e54eb34de92247f637d1fa9eae688",
                ["x86_64-linux"] = "f8dfc3f9d27cadc2e2c9d489394ef7c568291e2382a4d184865701bf1a4ac30a",
            },
        },
        ["18.25.0"] = {
            digests = {
                ["aarch64-linux"] = "1dc0cb006252cb4f0b4441fc885f7cba9798af0ed0c4df28c99f13cdacc15613",
                ["aarch64-macos"] = "fbd4f848a1620c9bcd51fd7a4292a2b1ad9a8b400967f0f7d7745b7234b3b3a3",
                ["x86_64-linux"] = "9ebfb49d9f5cc5fb03588315f8f54277fe9e3648bd98de7666a350000670cd19",
            },
        },
    },
}
