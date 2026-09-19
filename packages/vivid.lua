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
    build = {
        backend = "rust",
        rust = { packages = { "vivid" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sharkdp/vivid/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "vivid-{version}",
        },
    },
    outputs = {
        bins = { "vivid" },
        checks = { { "vivid", "--version" }, { "vivid", "generate", "molokai" } },
    },
    versions = {
        ["0.11.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "a43ccfbc6554055181a08f2740664f9280fa2d0e57c4641850c60dd0e5323720",
                },
            },
        },
    },
}
