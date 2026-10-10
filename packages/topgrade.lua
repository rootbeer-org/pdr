return {
    name = "topgrade",
    description = "Update installed tools and packages",
    homepage = "https://github.com/topgrade-rs/topgrade",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "topgrade-rs/topgrade",
        repository_id = 549714010,
        tag = "v{version}",
    },
    prebuilt = {
        github = "topgrade-rs/topgrade",
        tag = "v{version}",
        asset = "topgrade-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "topgrade" },
        checks = {
            { "topgrade", "--version" },
            { "topgrade", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "17.12.3",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "17.12.3",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "17.12.3",
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
        ["17.12.1"] = {
            digests = {
                ["aarch64-linux"] = "fcaf1eac3853b798d1cb4c01b8105594ec42d255399fd071d4c6724aab213b48",
                ["aarch64-macos"] = "1403f888def41e4897d293641d61fa24c9c7dc8db41c92c1377638e55c598ba9",
                ["x86_64-linux"] = "aeffdff8f6a3700ded918dd746dded2306ad404c5d814142e4fbc9d4a2c98954",
            },
        },
        ["17.12.2"] = {
            digests = {
                ["aarch64-linux"] = "a762e7161ac1370f77795be4cc483e183b93249db8b58e1ac355bd02a10bb2e3",
                ["aarch64-macos"] = "7d00e60656ff41a95b26e76b63bf4777f7d1272bfa969dbd4669d665629ab7c2",
                ["x86_64-linux"] = "ad6d9ca6932332757f21e4078ae4290cced235f92a4d380df3a250e6da779ca9",
            },
        },
        ["17.12.3"] = {
            digests = {
                ["aarch64-linux"] = "786a96afd3f3a12438b3a5d5eddfa9985b88b8931d14e945dabd0d557f201dfe",
                ["aarch64-macos"] = "c9c812be33e46adab0d6562b27225a85c50ba3f53c7b9cafbb3a82f1270fb6c3",
                ["x86_64-linux"] = "b7133fad0c2f69ff33eb8f3b91705024208b9742f45eb4beb9bccd4b581a7608",
            },
        },
    },
}
