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
    build = {
        backend = "rust",
        rust = { packages = { "tealdeer" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/tealdeer-rs/tealdeer/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "tealdeer-{version}",
        },
    },
    outputs = {
        bins = { "tldr" },
        checks = { { "tldr", "--version" } },
    },
    versions = {
        ["1.9.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "1387a04ddba714668ff0925377a2de0d0ab14533d44dd0766d673fbbd71e3119",
                },
            },
        },
    },
}
