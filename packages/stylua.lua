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
    build = {
        backend = "rust",
        rust = {
            packages = { "stylua" },
            features = { "lua52", "lua53", "lua54", "luau", "luajit", "cfxlua" },
        },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/JohnnyMorganz/StyLua/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "StyLua-{version}",
        },
    },
    outputs = {
        bins = { "stylua" },
        checks = { { "stylua", "--version" } },
    },
    versions = {
        ["2.5.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "26a220c7bf3a8f50d12b76c952fc4569a1162e2d002440faac3344a3634db4f2",
                },
            },
        },
    },
}
