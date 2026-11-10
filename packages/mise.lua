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
            default_version = "2026.11.6",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.6",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.6",
        },
    },
    versions = {
        ["2026.11.5"] = {
            digests = {
                ["aarch64-linux"] = "5b6a086507cd49e1135165ceaeb643e14af2f48b44bf5a67ce491db6b49dc9eb",
                ["aarch64-macos"] = "f69c8a4f7c265d5f3ffdd06d44104aa15a7ffd9b6545a87b7768f893b70f0fd8",
                ["x86_64-linux"] = "5cf376858e091c4f3fe55b063f94bd3ee285ab611cec0cb1a9d6d7986c49a433",
            },
        },
        ["2026.11.6"] = {
            digests = {
                ["aarch64-linux"] = "982a195d32427364beb878e1933b76aa5b1d1ccf82c3aca8cfcc2675666546a2",
                ["aarch64-macos"] = "74cf55e92f6c6b1f166781c36db35db9420a4cbf40d62d85c1b9d5dc76e0ba72",
                ["x86_64-linux"] = "2cc1157b9d75a1c6a63aa7231a047c33b43f273fd2bc545ab51ae9db4f74993a",
            },
        },
    },
}
