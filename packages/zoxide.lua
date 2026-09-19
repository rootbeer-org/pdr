return {
    schema = 2,
    name = "zoxide",
    description = "Navigate frequently used directories",
    default_version = "0.10.0",
    homepage = "https://crates.io/crates/zoxide",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "ajeetdsouza/zoxide",
        repository_id = 245166720,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "ajeetdsouza/zoxide",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "zoxide-{version}-x86_64-unknown-linux-musl.tar.gz",
                ["aarch64-macos"] = "zoxide-{version}-aarch64-apple-darwin.tar.gz",
                ["aarch64-linux"] = "zoxide-{version}-aarch64-unknown-linux-musl.tar.gz",
            },
        },
    },
    outputs = {
        bins = { "zoxide" },
        checks = { { "zoxide", "--version" }, { "zoxide", "init", "zsh" } },
    },
    versions = {
        ["0.10.0"] = {
            revision = 2,
        },
    },
}
