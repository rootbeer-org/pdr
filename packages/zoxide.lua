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
    build = {
        backend = "rust",
        rust = { packages = { "zoxide" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/ajeetdsouza/zoxide/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "zoxide-{version}",
        },
    },
    outputs = {
        bins = { "zoxide" },
        checks = { { "zoxide", "--version" }, { "zoxide", "init", "zsh" } },
    },
    versions = {
        ["0.10.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "4fcd4272b013a10b637dbcc299c58a9924b94470a9042677ca1a204cc2e9150e",
                },
            },
        },
    },
}
