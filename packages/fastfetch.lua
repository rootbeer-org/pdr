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
            default_version = "2.70.0",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "2.69.0",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "2.70.0",
        },
    },
    versions = {
        ["2.69.0"] = {
            digests = {
                ["aarch64-linux"] = "843a0d4e3d604efc7cce18df1efcc09b00a1960cfea9949118b50bf999694027",
                ["aarch64-macos"] = "3901a90b11f1823a00fea6f3c3c877e7f336465e9d9facc98fd6b8803e8fac7e",
                ["x86_64-linux"] = "9fe880a34de3fec88e57a69230c02fd7be0846db3f3ea9f88f2b74489a79ff55",
            },
        },
        ["2.70.0"] = {
            digests = {
                ["aarch64-linux"] = "fff4a127e4d76242e3bdac2a12430fc252fd6086d3eb30aee0382c3b0fece478",
                ["x86_64-linux"] = "945b941b2a85e8de88b4c89714ad18ee6a7a129bb3c544bb448e9e0e027c226a",
            },
        },
    },
}
