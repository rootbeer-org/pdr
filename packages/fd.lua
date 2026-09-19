return {
    schema = 2,
    name = "fd",
    description = "Find files by name",
    default_version = "10.5.0",
    homepage = "https://github.com/sharkdp/fd",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "sharkdp/fd",
        repository_id = 90793418,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "sharkdp/fd",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "fd-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "fd-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "fd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "fd" },
        checks = { { "fd", "--version" } },
    },
    versions = {
        ["10.4.2"] = {
            revision = 2,
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["10.5.0"] = {
            revision = 2,
        },
    },
}
