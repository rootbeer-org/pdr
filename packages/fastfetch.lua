return {
    name = "fastfetch",
    description = "Display system information",
    homepage = "https://github.com/fastfetch-cli/fastfetch",
    recipe_maintainers = { "tale" },
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
            default_version = "2.69.0",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "2.69.0",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "2.69.0",
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
        ["2.69.0"] = {
            digests = {
                ["aarch64-linux"] = "843a0d4e3d604efc7cce18df1efcc09b00a1960cfea9949118b50bf999694027",
                ["aarch64-macos"] = "3901a90b11f1823a00fea6f3c3c877e7f336465e9d9facc98fd6b8803e8fac7e",
                ["x86_64-linux"] = "9fe880a34de3fec88e57a69230c02fd7be0846db3f3ea9f88f2b74489a79ff55",
            },
        },
    },
}
