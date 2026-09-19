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
    inputs = {
        prebuilt = {
            github = "sharkdp/hyperfine",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "hyperfine-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "hyperfine-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "hyperfine-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "hyperfine" },
        checks = { { "hyperfine", "--version" } },
    },
    versions = {
        ["1.20.0"] = {
            revision = 2,
        },
    },
}
