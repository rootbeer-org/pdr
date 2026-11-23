return {
    name = "stylua",
    description = "Format Lua and Luau source code",
    homepage = "https://github.com/JohnnyMorganz/StyLua",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "JohnnyMorganz/StyLua",
        repository_id = 321792527,
        tag = "v{version}",
    },
    prebuilt = {
        github = "JohnnyMorganz/StyLua",
        tag = "v{version}",
        asset = "stylua-{target}.zip",
    },
    outputs = {
        bins = { "stylua" },
        checks = {
            { "stylua", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64-musl",
            default_version = "2.6.0",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "2.6.0",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64-musl",
            default_version = "2.6.0",
        },
    },
    versions = {
        ["2.5.2"] = {
            digests = {
                ["aarch64-linux"] = "b948df6b4bae41af9a70948174372f96a3c14d44e3e017288701539f3db8fb75",
                ["aarch64-macos"] = "92ff0889e16324801bc072692974bb67f8161e62010fc90f96c62a17f81f32c7",
                ["x86_64-linux"] = "ca6f1cf52eaf69e6632b81acef9c197aa24b85eb30d2455a35e7dbe28ae77c72",
            },
            trees = {
                ["aarch64-linux"] = "14ec56943be0505445f1d850b0a415cac961d2fc92498a3453058f0c10e5bfca",
                ["aarch64-macos"] = "bb4c136821de2dfc626e20efa2572d33b4d150166d98cd720ebd074d9086b56e",
                ["x86_64-linux"] = "2e9698f3d17f239bb513fe7dca33a46c1c832abd9db60f429d4b0dcf55d798df",
            },
            revision = 2,
        },
        ["2.6.0"] = {
            digests = {
                ["aarch64-linux"] = "278495597e3827417f3af7b9ad38011ad4a5ec725503553160ab69b7301059bb",
                ["aarch64-macos"] = "dab9b66d340ca5ffc8225211f1dcf89b84783e09b8cbec8c518497eba81f3c42",
                ["x86_64-linux"] = "48ee7db28346f96f4bd545e190ab080a88a7b5a664e97649cf5d5c60426f402d",
            },
            trees = {
                ["aarch64-linux"] = "dc5fe94c88214f6e3869f7d796185b8f43a92467ee17cdaafe01c970007b8371",
                ["aarch64-macos"] = "71673657d290a11c25112a1f683b975356b6568c37552f652a5cba17abb98890",
                ["x86_64-linux"] = "a7c9d46be7774d042901a6fdedefabca9e8e48328a133003a07ff63525fd1c4f",
            },
        },
    },
}
