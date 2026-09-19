return {
    schema = 2,
    name = "vivid",
    description = "Generate color themes for file listings",
    default_version = "0.11.1",
    homepage = "https://github.com/sharkdp/vivid",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sharkdp/vivid",
        repository_id = 158295285,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sharkdp/vivid",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "vivid-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "vivid-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "vivid-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "vivid" },
        checks = { { "vivid", "--version" }, { "vivid", "generate", "molokai" } },
    },
    versions = {
        ["0.11.1"] = {
            revision = 2,
        },
    },
}
