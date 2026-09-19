return {
    schema = 2,
    name = "hyperfine",
    description = "Benchmark command execution",
    default_version = "1.20.0",
    homepage = "https://github.com/sharkdp/hyperfine",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sharkdp/hyperfine",
        repository_id = 117356231,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "hyperfine" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sharkdp/hyperfine/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "hyperfine-{version}",
        },
    },
    outputs = {
        bins = { "hyperfine" },
        checks = { { "hyperfine", "--version" } },
    },
    versions = {
        ["1.20.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "f90c3b096af568438be7da52336784635a962c9822f10f98e5ad11ae8c7f5c64",
                },
            },
        },
    },
}
