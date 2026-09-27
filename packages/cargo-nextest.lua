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
            default_version = "0.9.146",
        },
        ["aarch64-macos"] = {
            default_version = "0.9.146",
        },
        ["x86_64-linux"] = {
            default_version = "0.9.146",
        },
    },
    versions = {
        ["0.9.146"] = {
            digests = {
                ["aarch64-linux"] = "c82aa0dfea628ff44b1f3ded405aa53ae74615c268bc5f760d32238e1b88f6bd",
                ["aarch64-macos"] = "c82aa0dfea628ff44b1f3ded405aa53ae74615c268bc5f760d32238e1b88f6bd",
                ["x86_64-linux"] = "c82aa0dfea628ff44b1f3ded405aa53ae74615c268bc5f760d32238e1b88f6bd",
            },
        },
    },
}
