return {
    schema = 2,
    name = "ripgrep",
    aliases = { "rg" },
    description = "Search file contents with regular expressions",
    default_version = "15.2.0",
    homepage = "https://github.com/BurntSushi/ripgrep",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "BurntSushi/ripgrep",
        repository_id = 53631945,
        tag_prefix = "",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "ripgrep" },
            features = { "pcre2" },
            environment = { PCRE2_SYS_STATIC = "1" },
        },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/BurntSushi/ripgrep/tar.gz/refs/tags/{version}",
            archive = "tar.gz",
            strip_prefix = "ripgrep-{version}",
        },
    },
    outputs = {
        bins = { "rg" },
        checks = { { "rg", "--version" }, { "rg", "--pcre2-version" } },
    },
    versions = {
        ["15.2.0"] = {
            revision = 4,
            inputs = {
                source = {
                    sha256 = "7605249d3eb0d5f170e3414498e3344e26b1e7a147aec518b57090b80036a562",
                },
            },
        },
    },
}
