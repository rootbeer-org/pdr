return {
    name = "procs",
    description = "View and search running processes",
    homepage = "https://github.com/dalance/procs",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dalance/procs",
        repository_id = 167957539,
        tag = "v{version}",
    },
    prebuilt = {
        github = "dalance/procs",
        tag = "v{version}",
        asset = "procs-{tag}-{target}.zip",
    },
    outputs = {
        bins = { "procs" },
        checks = {
            { "procs", "--version" },
            { "procs", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-linux",
            default_version = "0.14.12",
        },
        ["aarch64-macos"] = {
            target = "aarch64-mac",
            default_version = "0.14.12",
        },
        ["x86_64-linux"] = {
            target = "x86_64-linux",
            default_version = "0.14.12",
        },
    },
    versions = {
        ["0.14.12"] = {
            digests = {
                ["aarch64-linux"] = "74b4f82acc6fe553cbd5af20ba0baac420b42bef9bb0cbb38fef14b8317d9f91",
                ["aarch64-macos"] = "20c7a33426ed7a43c3e13a48f2d1866ecc979a8ad46733f86ddc78ab7f12d49c",
                ["x86_64-linux"] = "81964faf9d5cd0e9f399d5d0954fb6fe4d4d9f7d3cbec4507633df5a45b11713",
            },
            trees = {
                ["aarch64-linux"] = "991a3128fc5eaf5a55f9c6bd90cb7a0c1c21484281c7cf049ba4f306747adba8",
                ["aarch64-macos"] = "9ce720d1a69ce689a1564bdb3a68dae37e669e80ebd8e28abad722757d9ecd27",
                ["x86_64-linux"] = "f6528efc8c520dc7a703ee3f3e471cf61dcc20a42890a91665d3ae788c6bba7d",
            },
            revision = 2,
        },
    },
}
