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
            { package = "7zip", version = "26.04", kind = "build" },
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
            default_version = "0.64.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.64.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.64.1",
        },
    },
    versions = {
        ["0.64.0"] = {
            digests = {
                ["aarch64-linux"] = "6366cda97e81de1bbc54d91d461e857afa595feb568bd1bec94ab2122e13d969",
                ["aarch64-macos"] = "791560cf48299933a9fff2aea93b7e42b39e62d8a109634619d01c4f2c1aa68a",
                ["x86_64-linux"] = "21ac931303bb420bbdf3e0589506e5c32611c9fcff4ed2eb9802db657c499e9a",
            },
        },
        ["0.64.1"] = {
            digests = {
                ["aarch64-linux"] = "c8826c0b72fc0e1655404bf91fc29f821c01436e53152788e417df13a40d0671",
                ["aarch64-macos"] = "d2a6e67e6aa308ed13d09627e8a8e8fe2cd3f62aeb406fe653d59bcec2c25c47",
                ["x86_64-linux"] = "aad2ee102014c563112dcdad65e131dbcfe123355ef948ae91d806e833cdbf40",
            },
        },
    },
}
