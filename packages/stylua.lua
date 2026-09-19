return {
    schema = 2,
    name = "stylua",
    description = "Format Lua and Luau source code",
    default_version = "2.5.2",
    homepage = "https://github.com/JohnnyMorganz/StyLua",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "JohnnyMorganz/StyLua",
        repository_id = 321792527,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "JohnnyMorganz/StyLua",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "stylua-linux-x86_64-musl.zip",
                ["aarch64-macos"] = "stylua-macos-aarch64.zip",
                ["aarch64-linux"] = "stylua-linux-aarch64-musl.zip",
            },
        },
    },
    outputs = {
        bins = { "stylua" },
        checks = { { "stylua", "--version" } },
    },
    versions = {
        ["2.5.2"] = {
            revision = 2,
        },
    },
}
