return {
    name = "topgrade",
    description = "Update installed tools and packages",
    homepage = "https://github.com/topgrade-rs/topgrade",
    default_license = "GPL-3.0",
    prebuilt = {
        github = "topgrade-rs/topgrade",
        tag = "v{version}",
        asset = "topgrade-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "topgrade" },
        checks = { { "topgrade", "--version" }, { "topgrade", "--help" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "17.12.0",
            upstream = {
                github = "topgrade-rs/topgrade",
                repository_id = 549714010,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.12.0",
            upstream = {
                github = "topgrade-rs/topgrade",
                repository_id = 549714010,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.12.0",
            upstream = {
                github = "topgrade-rs/topgrade",
                repository_id = 549714010,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["17.11.0"] = {
            digests = {
                ["aarch64-linux"] = "15972387e00b848987acdd91b35146c671bf70431c4fc163d3270a8c9968a0cf",
                ["aarch64-macos"] = "f7720000caa8fe886cfb822167530684adda808bbb8684cffad18b5a484bfe77",
                ["x86_64-linux"] = "27b33b8388cf50238e7bb101f9312a1f2a8095802642baa4f9b09e910a01fb85",
            },
            revision = 2,
        },
        ["17.12.0"] = {
            digests = {
                ["aarch64-linux"] = "534a2932a4a39b9c55b2bcfb1739fc3ba2d0ac73e32a0b4204078838a9a7cec8",
                ["aarch64-macos"] = "f68471e978e246f122b66744ed3a608a2dd6fa66bc9e5974536dcbb964ff25e0",
                ["x86_64-linux"] = "838f4625bfe78004c1a5cfeb338d4e210086002d583c717d0835dd926d3b6b4f",
            },
        },
    },
}
