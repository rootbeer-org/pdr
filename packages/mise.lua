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
            default_version = "2026.11.11",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.11",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.11",
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
        ["2026.11.11"] = {
            digests = {
                ["aarch64-linux"] = "06231a655ae71c6641230f563ab45c344fbea56a19ff5e8377603f536df6088e",
                ["aarch64-macos"] = "3a0b7a727d86bd15a64c6df9ef6531111a4741b07e6f1e2bb6f6bb5b09e2663f",
                ["x86_64-linux"] = "4760a05d70f8fcc2176f935705060c709bafde86e98b01a836ccd68129ccbc3d",
            },
        },
    },
}
