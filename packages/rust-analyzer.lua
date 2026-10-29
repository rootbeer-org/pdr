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
            default_version = "2026.10.26",
        },
        ["aarch64-macos"] = {
            default_version = "2026.10.26",
        },
        ["x86_64-linux"] = {
            default_version = "2026.10.26",
        },
    },
    versions = {
        ["2026.10.19"] = {
            digests = {
                ["aarch64-linux"] = "16bc0e82e7313f4b6ba7f4b74a6a50da4a95247e56351ee433a89750f8cf33cc",
                ["aarch64-macos"] = "16bc0e82e7313f4b6ba7f4b74a6a50da4a95247e56351ee433a89750f8cf33cc",
                ["x86_64-linux"] = "16bc0e82e7313f4b6ba7f4b74a6a50da4a95247e56351ee433a89750f8cf33cc",
            },
        },
        ["2026.10.26"] = {
            digests = {
                ["aarch64-linux"] = "de34f04868d5814b77964f380f21585915786ba46e15cf8606c7f60ab5f63204",
                ["aarch64-macos"] = "de34f04868d5814b77964f380f21585915786ba46e15cf8606c7f60ab5f63204",
                ["x86_64-linux"] = "de34f04868d5814b77964f380f21585915786ba46e15cf8606c7f60ab5f63204",
            },
        },
    },
}
