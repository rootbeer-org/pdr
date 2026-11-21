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
            default_version = "18.25.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.25.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.25.1",
        },
    },
    versions = {
        ["18.25.0"] = {
            digests = {
                ["aarch64-linux"] = "1dc0cb006252cb4f0b4441fc885f7cba9798af0ed0c4df28c99f13cdacc15613",
                ["aarch64-macos"] = "fbd4f848a1620c9bcd51fd7a4292a2b1ad9a8b400967f0f7d7745b7234b3b3a3",
                ["x86_64-linux"] = "9ebfb49d9f5cc5fb03588315f8f54277fe9e3648bd98de7666a350000670cd19",
            },
        },
        ["18.25.1"] = {
            digests = {
                ["aarch64-linux"] = "a76aff915be408f15eca033dfbd555bb8d1237e83b09562f7481636f7894555f",
                ["aarch64-macos"] = "c2d94ae74da55c644de08ce3eedb0abd5f4a32340f3e9b8e2dade29764ac524c",
                ["x86_64-linux"] = "f2bc97588d5aa91f49b992298544e13776df044cb4baf606875c7cc8444e9e00",
            },
        },
    },
}
