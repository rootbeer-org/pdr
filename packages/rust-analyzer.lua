return {
    name = "rust-analyzer",
    description = "Rust language server",
    homepage = "https://rust-analyzer.github.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "rust-lang/rust-analyzer",
        repository_id = 115039706,
        tag = "{version}",
        separator = "-",
    },
    source = {
        url = "https://codeload.github.com/rust-lang/rust-analyzer/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "rust-analyzer-{tag}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "rust-analyzer" },
            environment = {
                CFG_RELEASE = "{tag}",
            },
        },
    },
    outputs = {
        bins = { "rust-analyzer" },
        checks = {
            { "rust-analyzer", "--version" },
            { "rust-analyzer", "--print-config-schema" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2026.11.23",
        },
        ["aarch64-macos"] = {
            default_version = "2026.11.23",
        },
        ["x86_64-linux"] = {
            default_version = "2026.11.23",
        },
    },
    versions = {
        ["2026.11.16"] = {
            digests = {
                ["aarch64-linux"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
                ["aarch64-macos"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
                ["x86_64-linux"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
            },
        },
        ["2026.11.23"] = {
            digests = {
                ["aarch64-linux"] = "04c94c7a36c3793681aebee0085192e082b4bf8d206d42b64123c2143d7d5868",
                ["aarch64-macos"] = "04c94c7a36c3793681aebee0085192e082b4bf8d206d42b64123c2143d7d5868",
                ["x86_64-linux"] = "04c94c7a36c3793681aebee0085192e082b4bf8d206d42b64123c2143d7d5868",
            },
        },
    },
}
