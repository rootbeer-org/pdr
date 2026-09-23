return {
    name = "hexyl",
    description = "View binary files in hexadecimal",
    homepage = "https://github.com/sharkdp/hexyl",
    default_license = "Apache-2.0",
    upstream = {
        github = "sharkdp/hexyl",
        repository_id = 156294298,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sharkdp/hexyl",
        tag = "v{version}",
        asset = "hexyl-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "hexyl" },
        checks = {
            { "hexyl", "--version" },
            { "hexyl", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.17.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.17.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.17.0",
        },
    },
    versions = {
        ["0.17.0"] = {
            digests = {
                ["aarch64-linux"] = "70b97648935f98801fd3c3e4758ff4e92afcf7e75316ff65d4e4f5d2e321b658",
                ["aarch64-macos"] = "d8c50f5ec688faf566ea4c13d6aa12a5681dc370dab3ffba0a9db935a5986630",
                ["x86_64-linux"] = "82b374b800cc965f4116b9d5d6a50394945170d4f65b9ef6ced3b82b014de8a6",
            },
            revision = 2,
        },
    },
}
