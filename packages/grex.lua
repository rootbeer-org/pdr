return {
    schema = 2,
    name = "grex",
    description = "Generate regular expressions from examples",
    default_version = "1.4.6",
    homepage = "https://github.com/pemistahl/grex",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "pemistahl/grex",
        repository_id = 213043312,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "pemistahl/grex",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "grex-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "grex-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "grex-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "grex" },
        checks = { { "grex", "--version" }, { "grex", "abc", "abd" } },
    },
    versions = {
        ["1.4.6"] = {
            revision = 2,
        },
    },
}
