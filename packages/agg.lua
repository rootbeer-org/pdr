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
    inputs = {
        prebuilt = {
            github = "asciinema/agg",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "agg-x86_64-unknown-linux-musl",
                ["aarch64-macos"] = "agg-aarch64-apple-darwin",
                ["aarch64-linux"] = "agg-aarch64-unknown-linux-gnu",
            },
        },
    },
    outputs = {
        bins = { "agg" },
        checks = { { "agg", "--version" }, { "agg", "--help" } },
    },
    versions = {
        ["1.9.0"] = {
            revision = 2,
        },
    },
}
