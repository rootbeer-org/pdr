return {
    name = "fastfetch",
    description = "Display system information",
    homepage = "https://github.com/fastfetch-cli/fastfetch",
    default_license = "MIT",
    upstream = {
        github = "fastfetch-cli/fastfetch",
        repository_id = 340181518,
        tag = "{version}",
    },
    prebuilt = {
        github = "fastfetch-cli/fastfetch",
        tag = "{version}",
        asset = "fastfetch-{target}.tar.gz",
    },
    outputs = {
        bins = { "fastfetch" },
        checks = {
            { "fastfetch", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64",
            default_version = "2.68.1",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "2.68.1",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "2.68.1",
        },
    },
    versions = {
        ["2.68.1"] = {
            digests = {
                ["aarch64-linux"] = "d3369aa9c1bc77fd8bd7ba3be2ae2cdcece4a137620c48a9de58026779fdb7d4",
                ["aarch64-macos"] = "22426608dca945e0531af37054e21a2727aa7bb30179efaf44de7f59163be5fe",
                ["x86_64-linux"] = "0c51ef6fa3e976eb5038fe0afda38629d3ca07947740bb0e3354c7c4f1238c0c",
            },
            revision = 2,
        },
    },
}
