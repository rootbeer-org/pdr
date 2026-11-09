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
            default_version = "2026.11.5",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.5",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.5",
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
        ["2026.11.5"] = {
            digests = {
                ["aarch64-linux"] = "5b6a086507cd49e1135165ceaeb643e14af2f48b44bf5a67ce491db6b49dc9eb",
                ["aarch64-macos"] = "f69c8a4f7c265d5f3ffdd06d44104aa15a7ffd9b6545a87b7768f893b70f0fd8",
                ["x86_64-linux"] = "5cf376858e091c4f3fe55b063f94bd3ee285ab611cec0cb1a9d6d7986c49a433",
            },
        },
    },
}
