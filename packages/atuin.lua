return {
    name = "atuin",
    description = "Search and sync shell history",
    homepage = "https://github.com/atuinsh/atuin",
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
            default_version = "18.23.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.23.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.23.0",
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
        ["18.23.0"] = {
            digests = {
                ["aarch64-linux"] = "faf91adc71e6b661b21ed4f486babbd7af9d17363d4276da4a0251f83c72498d",
                ["aarch64-macos"] = "c988be1cde19cd7295ce64bc8b955d42fb1855e5227cb640c87fc09c8408c3fc",
                ["x86_64-linux"] = "d1b40dd6e7cd3d823867ffe22b39a025bc420f7875926ae9ca974155378da14d",
            },
        },
    },
}
