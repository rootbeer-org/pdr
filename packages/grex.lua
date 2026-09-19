return {
    schema = 2,
    name = "grex",
    description = "Generate regular expressions from examples",
    default_version = "1.4.6",
    homepage = "https://github.com/pemistahl/grex",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "pemistahl/grex",
        repository_id = 213043312,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "grex" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/pemistahl/grex/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "grex-{version}",
        },
    },
    outputs = {
        bins = { "grex" },
        checks = { { "grex", "--version" }, { "grex", "abc", "abd" } },
    },
    versions = {
        ["1.4.6"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2ab9cb4c3d921711f23ea33a9e60dc11e9eaab450b16d1f2247bea2276822433",
                },
            },
        },
    },
}
