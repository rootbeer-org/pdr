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
            default_version = "18.22.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.22.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.22.0",
        },
    },
    versions = {
        ["18.22.0"] = {
            digests = {
                ["aarch64-linux"] = "76d12818e3dff64ddac3b9f4ec63b305070ddcf5fc382a2a23dc0826fa9bf5a8",
                ["aarch64-macos"] = "5e6e525f60147351f114397e7f09aeded87f302e99ef83a5eee74c524b805812",
                ["x86_64-linux"] = "b3c123df1887cf27c6480a87d148c86831cd83da478e0a8ab773ca188f3f3222",
            },
            revision = 2,
        },
    },
}
