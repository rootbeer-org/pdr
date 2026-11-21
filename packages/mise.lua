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
            default_version = "2026.11.12",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.12",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.12",
        },
    },
    versions = {
        ["2026.11.11"] = {
            digests = {
                ["aarch64-linux"] = "06231a655ae71c6641230f563ab45c344fbea56a19ff5e8377603f536df6088e",
                ["aarch64-macos"] = "3a0b7a727d86bd15a64c6df9ef6531111a4741b07e6f1e2bb6f6bb5b09e2663f",
                ["x86_64-linux"] = "4760a05d70f8fcc2176f935705060c709bafde86e98b01a836ccd68129ccbc3d",
            },
        },
        ["2026.11.12"] = {
            digests = {
                ["aarch64-linux"] = "bd5adc3eaaaa886eac1be7a9f68c722c691ed05177b0169fe1ac944d0b47d177",
                ["aarch64-macos"] = "f7bd19aa4e6b7a58d7296f98e2c6af68b2e2643dfd608b0bc46c2b5fdbc8749b",
                ["x86_64-linux"] = "4c15d9027d11e85c03c10341cc56d70d8ef31f03db6f82737d7117aec30edb05",
            },
        },
    },
}
