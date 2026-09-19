return {
    schema = 2,
    name = "tealdeer",
    aliases = { "tldr" },
    description = "Read concise command-line usage examples",
    default_version = "1.9.0",
    homepage = "https://docs.tealdeer.org",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "tealdeer-rs/tealdeer",
        repository_id = 48739367,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "tealdeer-rs/tealdeer",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "tealdeer-linux-x86_64-musl",
                ["aarch64-macos"] = "tealdeer-macos-aarch64",
                ["aarch64-linux"] = "tealdeer-linux-aarch64-musl",
            },
        },
    },
    outputs = {
        bins = { "tldr" },
        checks = { { "tldr", "--version" } },
    },
    versions = {
        ["1.9.0"] = {
            revision = 2,
        },
    },
}
