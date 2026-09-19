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
    build = {
        backend = "rust",
        rust = { packages = { "pastel" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sharkdp/pastel/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "pastel-{version}",
        },
    },
    outputs = {
        bins = { "pastel" },
        checks = { { "pastel", "--version" }, { "pastel", "format", "hex", "red" } },
    },
    versions = {
        ["0.12.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2903853f24d742fe955edd9bea17947eb8f3f44000a8ac528d16f2ea1e52b78b",
                },
            },
        },
    },
}
