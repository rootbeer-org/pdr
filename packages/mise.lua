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
            default_version = "2026.10.19",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.10.19",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.10.19",
        },
    },
    versions = {
        ["2026.10.15"] = {
            digests = {
                ["aarch64-linux"] = "cb3d7896680b0289e98097cdb0c70f0989bdd5383dcf795f6d04a6cab703062a",
                ["aarch64-macos"] = "8a44a56f72323c777298a1d5abd88ffd21d0fca19fab1ccccd389a912374f69c",
                ["x86_64-linux"] = "e00c09db8f4d11e7c8d417a12584e2d1297583fcbcba1da1b9866bd24a0af503",
            },
        },
        ["2026.10.19"] = {
            digests = {
                ["aarch64-linux"] = "e9111d560bc0014eb83a9491604809bb4d03569d610b1df702369f69d36e3fc0",
                ["aarch64-macos"] = "a8a581e115f4ebdbe2931c237949dbac7624bd8b4024bf3eb9da7981bde490c9",
                ["x86_64-linux"] = "8284df180319249d4801b46a34afc5ba9ade5e9c5380ecd14d016f19e90b9ce1",
            },
        },
    },
}
