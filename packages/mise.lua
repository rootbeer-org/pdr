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
            default_version = "2026.10.24",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.10.24",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.10.24",
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
        ["2026.10.24"] = {
            digests = {
                ["aarch64-linux"] = "c1391f191cce6019ead500b6b22eb50f73bb0ba48f64619cc66bb27ff42840d0",
                ["aarch64-macos"] = "aa2fc59242db108f97ea9fb2d2e2cb42ff1467fcafe3c91e48d51c841ba67a65",
                ["x86_64-linux"] = "257bc6521a2401470fc38cf6be45bbf5783c0443c80298b61fb13f3354f7e06e",
            },
        },
    },
}
