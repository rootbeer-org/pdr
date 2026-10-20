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
            default_version = "0.64.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.64.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.64.0",
        },
    },
    versions = {
        ["0.58.0"] = {
            digests = {
                ["aarch64-linux"] = "c74dd4f48dd9b8d6d595acfb238dd32ede67bdf792e8c6e2b8760cdaff9d80fb",
                ["aarch64-macos"] = "06a7ea017e4d7da296f8a44fabb2f3d6ffafa91bbd5fddd4830bdc418bacb46d",
                ["x86_64-linux"] = "06c2a239a1214d5f9e76c364cadbd0ffaee710fdb516ca6448b08860364db6e2",
            },
        },
        ["0.64.0"] = {
            digests = {
                ["aarch64-linux"] = "6366cda97e81de1bbc54d91d461e857afa595feb568bd1bec94ab2122e13d969",
                ["aarch64-macos"] = "791560cf48299933a9fff2aea93b7e42b39e62d8a109634619d01c4f2c1aa68a",
                ["x86_64-linux"] = "21ac931303bb420bbdf3e0589506e5c32611c9fcff4ed2eb9802db657c499e9a",
            },
        },
    },
}
