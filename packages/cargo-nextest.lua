return {
    name = "cargo-nextest",
    aliases = { "nextest" },
    description = "Run Rust tests faster",
    homepage = "https://nexte.st/",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "nextest-rs/nextest",
        repository_id = 456728202,
        tag = "cargo-nextest-{version}",
    },
    source = {
        url = "https://codeload.github.com/nextest-rs/nextest/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "nextest-cargo-nextest-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "cargo-nextest" },
            features = { "default-no-update" },
            no_default_features = true,
        },
    },
    outputs = {
        bins = { "cargo-nextest" },
        checks = {
            { "cargo-nextest", "nextest", "--version" },
            { "cargo-nextest", "nextest", "run", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.9.152",
        },
        ["aarch64-macos"] = {
            default_version = "0.9.152",
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", kind = "build" },
                },
                rust = {
                    packages = { "cargo-nextest" },
                    no_default_features = true,
                },
            },
        },
        ["x86_64-linux"] = {
            default_version = "0.9.152",
        },
    },
    versions = {
        ["0.9.151"] = {
            digests = {
                ["aarch64-linux"] = "613c8855e6a5b9f9d12920bf74a0c191af3f8b5f86ff4cf27446f0f7adfc44ec",
                ["aarch64-macos"] = "613c8855e6a5b9f9d12920bf74a0c191af3f8b5f86ff4cf27446f0f7adfc44ec",
                ["x86_64-linux"] = "613c8855e6a5b9f9d12920bf74a0c191af3f8b5f86ff4cf27446f0f7adfc44ec",
            },
        },
        ["0.9.152"] = {
            digests = {
                ["aarch64-linux"] = "b93dfdf2c5d187f0154e71ee86bcfc40e8ea39abfe7bf20f95f1fa05c12afb2f",
                ["aarch64-macos"] = "b93dfdf2c5d187f0154e71ee86bcfc40e8ea39abfe7bf20f95f1fa05c12afb2f",
                ["x86_64-linux"] = "b93dfdf2c5d187f0154e71ee86bcfc40e8ea39abfe7bf20f95f1fa05c12afb2f",
            },
        },
    },
}
