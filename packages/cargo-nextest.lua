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
            default_version = "0.9.149",
        },
        ["aarch64-macos"] = {
            default_version = "0.9.149",
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
            default_version = "0.9.149",
        },
    },
    versions = {
        ["0.9.148"] = {
            digests = {
                ["aarch64-linux"] = "c047e6d430ab7faa807736ccd10245ed60c14c497584c23d5696c156caee43f3",
                ["aarch64-macos"] = "c047e6d430ab7faa807736ccd10245ed60c14c497584c23d5696c156caee43f3",
                ["x86_64-linux"] = "c047e6d430ab7faa807736ccd10245ed60c14c497584c23d5696c156caee43f3",
            },
        },
        ["0.9.149"] = {
            digests = {
                ["aarch64-linux"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
                ["aarch64-macos"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
                ["x86_64-linux"] = "3f1519ce8c3ae9e0442c0460995ed6802b70a73597b5876531f96c641577f21a",
            },
        },
    },
}
