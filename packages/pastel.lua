return {
    schema = 2,
    name = "pastel",
    description = "Generate and transform colors",
    default_version = "0.12.0",
    homepage = "https://github.com/sharkdp/pastel",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sharkdp/pastel",
        repository_id = 189867161,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sharkdp/pastel",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "pastel-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "pastel-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "pastel-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "pastel" },
        checks = { { "pastel", "--version" }, { "pastel", "format", "hex", "red" } },
    },
    versions = {
        ["0.12.0"] = {
            revision = 2,
        },
    },
}
