return {
    schema = 2,
    name = "dust",
    description = "Inspect directory disk usage",
    homepage = "https://github.com/bootandy/dust",
    default_version = "1.2.6",
    upstream = {
        github = "bootandy/dust",
        repository_id = 125563061,
        tag_prefix = "v",
        exclude_tags = { "v0.8.1-alpha.2", "v0.8.1-alpha.1", "untagged-1499119fdec1dec70238" },
    },
    inputs = {
        prebuilt = {
            github = "bootandy/dust",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "dust-{tag}-aarch64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "dust-{tag}-aarch64-apple-darwin.tar.gz",
                ["x86_64-linux"] = "dust-{tag}-x86_64-unknown-linux-musl.tar.gz",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "dust" },
        checks = {
            { "dust", "--version" },
        },
    },
    versions = {
        ["1.2.5"] = {
            revision = 2,
        },
        ["1.2.6"] = {},
    },
}
