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
    build = {
        backend = "rust",
        rust = { packages = { "hexyl" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sharkdp/hexyl/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "hexyl-{version}",
        },
    },
    outputs = {
        bins = { "hexyl" },
        checks = { { "hexyl", "--version" }, { "hexyl", "--help" } },
    },
    versions = {
        ["0.17.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "72fa17397ad187eec6b295d02c7caabbb209a6e0d5706187b8a599bd5df8615e",
                },
            },
        },
    },
}
