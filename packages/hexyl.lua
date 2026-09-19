return {
    schema = 2,
    name = "hexyl",
    description = "View binary files in hexadecimal",
    default_version = "0.17.0",
    homepage = "https://github.com/sharkdp/hexyl",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sharkdp/hexyl",
        repository_id = 156294298,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sharkdp/hexyl",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "hexyl-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "hexyl-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "hexyl-{tag}-aarch64-unknown-linux-gnu.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "hexyl" },
        checks = { { "hexyl", "--version" }, { "hexyl", "--help" } },
    },
    versions = {
        ["0.17.0"] = {
            revision = 2,
        },
    },
}
