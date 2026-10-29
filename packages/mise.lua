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
            default_version = "2026.10.23",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.10.23",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.10.23",
        },
    },
    versions = {
        ["2026.10.19"] = {
            digests = {
                ["aarch64-linux"] = "e9111d560bc0014eb83a9491604809bb4d03569d610b1df702369f69d36e3fc0",
                ["aarch64-macos"] = "a8a581e115f4ebdbe2931c237949dbac7624bd8b4024bf3eb9da7981bde490c9",
                ["x86_64-linux"] = "8284df180319249d4801b46a34afc5ba9ade5e9c5380ecd14d016f19e90b9ce1",
            },
        },
        ["2026.10.23"] = {
            digests = {
                ["aarch64-linux"] = "bc65f5413ca407f6b7587c010e82b07c0e29c7cb03368e386b11e1f96ea637ff",
                ["aarch64-macos"] = "b9146f565a02c18dc117e63a9e59ec1cb5189d1602e2cc68b27c0322c2a5908d",
                ["x86_64-linux"] = "c297998a3d6870db26ea42eb114e273d43a197eb37c4eecd73507b7bf007fbcd",
            },
        },
    },
}
