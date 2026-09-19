return {
    schema = 2,
    name = "sd",
    description = "Find and replace text",
    default_version = "1.1.0",
    homepage = "https://github.com/chmln/sd",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "chmln/sd",
        repository_id = 162863623,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "chmln/sd",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "sd-{tag}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "sd-{tag}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "sd-{tag}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "sd" },
        checks = { { "sd", "--version" } },
    },
    versions = {
        ["1.1.0"] = {
            revision = 2,
        },
    },
}
