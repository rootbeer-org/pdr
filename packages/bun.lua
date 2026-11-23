return {
    name = "bun",
    description = "JavaScript runtime, bundler, test runner, and package manager",
    homepage = "https://bun.sh",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "oven-sh/bun",
        repository_id = 357728969,
        tag = "bun-v{version}",
    },
    prebuilt = {
        github = "oven-sh/bun",
        tag = "bun-v{version}",
        asset = "bun-{target}.zip",
        install = {
            Archive = {
                format = "Zip",
                strip_prefix = "bun-{target}",
            },
        },
        steps = {
            install = {
                { "ln", "-s", "bun", "bunx" },
            },
        },
    },
    outputs = {
        bins = {
            bun = "bun",
            bunx = "bunx",
        },
        checks = {
            { "bun", "--version" },
            { "bun", "-e", "console.log(1+1)" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64",
            default_version = "1.4.5",
        },
        ["aarch64-macos"] = {
            target = "darwin-aarch64",
            default_version = "1.4.5",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "1.4.5",
        },
    },
    versions = {
        ["1.4.4"] = {
            digests = {
                ["aarch64-linux"] = "baa6bb36f51d6e58561e02bbea825038a9df454f673d6d776e8bbf86f8c7850e",
                ["aarch64-macos"] = "c240d7f0ccb90c263a849fcdb09b7ee62630d921348ed6aafda86b9d577bc510",
                ["x86_64-linux"] = "bf8ccbfb2b0b80159e0f9a6d15c55317add8077534dbc6130a3edb52fccb395c",
            },
            trees = {
                ["aarch64-linux"] = "7a8ec4c2dfca3b82ed549480b5a39d23e3073771194d2f337e384d94297d17f7",
                ["aarch64-macos"] = "19bd331b537299f25f214ebec07794d1759e7b580f585d6e7476f0b5230707ab",
                ["x86_64-linux"] = "be92024511774b9146018f2cbddd6120164a1bbcb5e6f8d9ee7dd7173baf9e45",
            },
        },
        ["1.4.5"] = {
            digests = {
                ["aarch64-linux"] = "18656a3bf0ea5641f5796ae4213b75255579a70a0fded2f337933785568cdf84",
                ["aarch64-macos"] = "b5d6bc2e13caf14e57c89661e89efd073ff16165b41bfe43882616410609cd10",
                ["x86_64-linux"] = "94559b3b528995a49452f9f2404cec74f2efd7d06e0a000a8cd214b02c3666eb",
            },
            trees = {
                ["aarch64-linux"] = "65ee8257b8604a9f5decfd404a2e76aca43603f60aea675841adf321aa09691d",
                ["aarch64-macos"] = "e2034be4c320939991c0136dd67ac549825fea5ebacdbec4359982d63a0731b1",
                ["x86_64-linux"] = "d0ed15892e7593ca1e428f782ba9c21d047ae1780d544f3e509e56bfb29be0f5",
            },
        },
    },
}
