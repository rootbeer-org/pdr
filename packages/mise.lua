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
            default_version = "2026.11.3",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.3",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.3",
        },
    },
    versions = {
        ["2026.10.23"] = {
            digests = {
                ["aarch64-linux"] = "bc65f5413ca407f6b7587c010e82b07c0e29c7cb03368e386b11e1f96ea637ff",
                ["aarch64-macos"] = "b9146f565a02c18dc117e63a9e59ec1cb5189d1602e2cc68b27c0322c2a5908d",
                ["x86_64-linux"] = "c297998a3d6870db26ea42eb114e273d43a197eb37c4eecd73507b7bf007fbcd",
            },
        },
        ["2026.11.3"] = {
            digests = {
                ["aarch64-linux"] = "975fcaac68ddf1a667ceceab30168989d3645f6894b39b40a7b0e6de94096101",
                ["aarch64-macos"] = "de9a54330fee4edede51a3cf6196bbf522f01c5e3fd981e0bebea33f561a0431",
                ["x86_64-linux"] = "af4122789a7ede3e2c308c9aaa03e55d0d88956ba6bece2cd46b002630e38f9c",
            },
        },
    },
}
