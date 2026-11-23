return {
    name = "dprint",
    description = "Format source files with configurable plugins",
    homepage = "https://dprint.dev/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dprint/dprint",
        repository_id = 192136193,
        tag = "{version}",
    },
    prebuilt = {
        github = "dprint/dprint",
        tag = "{version}",
        asset = "dprint-{target}.zip",
    },
    outputs = {
        bins = { "dprint" },
        checks = {
            { "dprint", "--version" },
            { "dprint", "help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.65.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.65.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.65.0",
        },
    },
    versions = {
        ["0.64.3"] = {
            digests = {
                ["aarch64-linux"] = "61c8936368ff4030a615ce43853adc5a0707ff77973743d0a691aee2cbf64723",
                ["aarch64-macos"] = "94b48820945602fb113a34343db0a9e653a8346c60966f790556dc9ce4084a92",
                ["x86_64-linux"] = "f105dbc2b0bc0d83c644fcabc3e7bd8779469c0d9faeda48365c58b389d5a443",
            },
            trees = {
                ["aarch64-linux"] = "47f5bc5f7c96b927d545fa6833ccc2a0bba2ad52240b020a9e4c73d59845fc3a",
                ["aarch64-macos"] = "0dcbf6a31c1cfb1ac74683aed88c8719df7c737380fae44932b6b3e7e7bb6820",
                ["x86_64-linux"] = "3764a9beef738c383798def39a6693a3d9ba0606c1f5c2158c914bacf1c97db3",
            },
        },
        ["0.65.0"] = {
            digests = {
                ["aarch64-linux"] = "a427ef844b300d896b3f836706bb77d8df6b77f8f2627103c4a34ded94cf6ae1",
                ["aarch64-macos"] = "5e57a5e75f5d29d1f9dcc10255fccb9815031f4720fe6759643d0ee12cf201f2",
                ["x86_64-linux"] = "61707303f4305891fecffec1f92ec8243b07e9d3ba8a7e81f7543fc77fb0002d",
            },
            trees = {
                ["aarch64-linux"] = "32051e750e37350c98b3730acbf9702ad409bc7a308e04525594631a9a7c9e53",
                ["aarch64-macos"] = "2f8004df18f30be007190adcc6ea27ac7a77191a4380bff52dc2d622f77e658c",
                ["x86_64-linux"] = "c0682d927be9fb4650a689c6c3c56f6594639a091fb8cc35551694b43101c82a",
            },
        },
    },
}
