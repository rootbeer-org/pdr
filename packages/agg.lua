return {
    schema = 2,
    name = "agg",
    description = "Convert terminal recordings to animated GIFs",
    default_version = "1.9.0",
    homepage = "https://github.com/asciinema/agg",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "asciinema/agg",
        repository_id = 519132476,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "agg" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/asciinema/agg/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "agg-{version}",
        },
    },
    outputs = {
        bins = { "agg" },
        checks = { { "agg", "--version" }, { "agg", "--help" } },
    },
    versions = {
        ["1.9.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "8170119502ad2c1c697e5cd4d050d87c425ecee726c5f6c3c2140703bcb31bb3",
                },
            },
        },
    },
}
