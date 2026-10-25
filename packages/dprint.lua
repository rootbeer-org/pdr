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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
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
            default_version = "0.64.3",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.64.3",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.64.3",
        },
    },
    versions = {
        ["0.64.1"] = {
            digests = {
                ["aarch64-linux"] = "c8826c0b72fc0e1655404bf91fc29f821c01436e53152788e417df13a40d0671",
                ["aarch64-macos"] = "d2a6e67e6aa308ed13d09627e8a8e8fe2cd3f62aeb406fe653d59bcec2c25c47",
                ["x86_64-linux"] = "aad2ee102014c563112dcdad65e131dbcfe123355ef948ae91d806e833cdbf40",
            },
        },
        ["0.64.3"] = {
            digests = {
                ["aarch64-linux"] = "61c8936368ff4030a615ce43853adc5a0707ff77973743d0a691aee2cbf64723",
                ["aarch64-macos"] = "94b48820945602fb113a34343db0a9e653a8346c60966f790556dc9ce4084a92",
                ["x86_64-linux"] = "f105dbc2b0bc0d83c644fcabc3e7bd8779469c0d9faeda48365c58b389d5a443",
            },
        },
    },
}
