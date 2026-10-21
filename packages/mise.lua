return {
    name = "mise",
    description = "Manage development tools and tasks",
    homepage = "https://mise.jdx.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "jdx/mise",
        repository_id = 586920414,
        tag = "v{version}",
    },
    prebuilt = {
        github = "jdx/mise",
        tag = "v{version}",
        asset = "mise-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "mise" },
        checks = {
            { "mise", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64-musl",
            default_version = "2026.10.15",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.10.15",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.10.15",
        },
    },
    versions = {
        ["2026.10.0"] = {
            digests = {
                ["aarch64-linux"] = "7e0a2bcfc44fad4dd19654bd1261915802e2334becdc985ffa8becfe9de9cb01",
                ["aarch64-macos"] = "e6a966e44f871403df905d50019ca6f7b84624ddfe1d5c095f5bc3f18709259e",
                ["x86_64-linux"] = "df32ce8cb98e801ad48ed523e30ff6bcfe7311c45567a8b0dbb2c5181f09d436",
            },
        },
        ["2026.10.15"] = {
            digests = {
                ["aarch64-linux"] = "cb3d7896680b0289e98097cdb0c70f0989bdd5383dcf795f6d04a6cab703062a",
                ["aarch64-macos"] = "8a44a56f72323c777298a1d5abd88ffd21d0fca19fab1ccccd389a912374f69c",
                ["x86_64-linux"] = "e00c09db8f4d11e7c8d417a12584e2d1297583fcbcba1da1b9866bd24a0af503",
            },
        },
    },
}
