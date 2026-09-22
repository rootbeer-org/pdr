return {
    name = "stylua",
    description = "Format Lua and Luau source code",
    homepage = "https://github.com/JohnnyMorganz/StyLua",
    default_license = "MPL-2.0",
    prebuilt = {
        github = "JohnnyMorganz/StyLua",
        tag = "v{version}",
        asset = "stylua-{target}.zip",
    },
    outputs = { bins = { "stylua" }, checks = { { "stylua", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64-musl",
            default_version = "2.5.2",
            upstream = {
                github = "JohnnyMorganz/StyLua",
                repository_id = 321792527,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "2.5.2",
            upstream = {
                github = "JohnnyMorganz/StyLua",
                repository_id = 321792527,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64-musl",
            default_version = "2.5.2",
            upstream = {
                github = "JohnnyMorganz/StyLua",
                repository_id = 321792527,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["2.5.2"] = {
            digests = {
                ["aarch64-linux"] = "b948df6b4bae41af9a70948174372f96a3c14d44e3e017288701539f3db8fb75",
                ["aarch64-macos"] = "92ff0889e16324801bc072692974bb67f8161e62010fc90f96c62a17f81f32c7",
                ["x86_64-linux"] = "ca6f1cf52eaf69e6632b81acef9c197aa24b85eb30d2455a35e7dbe28ae77c72",
            },
            revision = 2,
        },
    },
}
