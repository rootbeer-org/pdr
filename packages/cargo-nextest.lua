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
            default_version = "0.9.150",
        },
        ["aarch64-macos"] = {
            default_version = "0.9.150",
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
            default_version = "0.9.150",
        },
    },
    versions = {
        ["0.9.149"] = {
            digests = {
                ["aarch64-linux"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
                ["aarch64-macos"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
                ["x86_64-linux"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
            },
        },
        ["0.9.150"] = {
            digests = {
                ["aarch64-linux"] = "52daf837e45bf08815f1fa92202adb28d835c04b3e8f1fc9a2d1b47e2b6537c6",
                ["aarch64-macos"] = "52daf837e45bf08815f1fa92202adb28d835c04b3e8f1fc9a2d1b47e2b6537c6",
                ["x86_64-linux"] = "52daf837e45bf08815f1fa92202adb28d835c04b3e8f1fc9a2d1b47e2b6537c6",
            },
        },
    },
}
