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
            default_version = "2026.11.10",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.10",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.10",
        },
    },
    versions = {
        ["2026.11.10"] = {
            digests = {
                ["aarch64-linux"] = "3efbddd8b386f7b08f458bb7f6be5a098f235e4192a62ae9fca13c57ecff0a79",
                ["aarch64-macos"] = "0ff163f78007130393ed5303aad06bc5e793c0bd298bc77eeb5913a3748e1922",
                ["x86_64-linux"] = "d281de4697f99dcb4192b74c5c2a023d0a6f36a8a04adc304b4b93693c65db61",
            },
        },
        ["2026.11.9"] = {
            digests = {
                ["aarch64-linux"] = "5e83d1421adef773f7187fb25a3d6f9b91094d728c7155fcf396b71736f441d7",
                ["aarch64-macos"] = "e4509f159e0492e89065edcf52f2918e2751e3574620586058468ba0563aed59",
                ["x86_64-linux"] = "3ec9f5dcb28da4280107d6904fc399b0c9c3d319d99b6b3c2de8e51e8e7200c1",
            },
        },
    },
}
