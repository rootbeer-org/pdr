return {
    name = "rust-analyzer",
    description = "Serve Rust language intelligence over LSP",
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
            default_version = "2026.11.16",
        },
        ["aarch64-macos"] = {
            default_version = "2026.11.16",
        },
        ["x86_64-linux"] = {
            default_version = "2026.11.16",
        },
    },
    versions = {
        ["2026.11.09"] = {
            digests = {
                ["aarch64-linux"] = "c198b54c0e17b224665ec2272b7dab6bb98b0c17123ea559d0dddbb0d287ccdf",
                ["aarch64-macos"] = "c198b54c0e17b224665ec2272b7dab6bb98b0c17123ea559d0dddbb0d287ccdf",
                ["x86_64-linux"] = "c198b54c0e17b224665ec2272b7dab6bb98b0c17123ea559d0dddbb0d287ccdf",
            },
        },
        ["2026.11.16"] = {
            digests = {
                ["aarch64-linux"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
                ["aarch64-macos"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
                ["x86_64-linux"] = "b80b65ab44e10abddb07ba46721c3a8e5d9baae4e757807982a1abfc2790a402",
            },
        },
    },
}
