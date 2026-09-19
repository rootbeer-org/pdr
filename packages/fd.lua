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
    build = {
        backend = "rust",
        rust = { packages = { "fd-find" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sharkdp/fd/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "fd-{version}",
        },
    },
    outputs = {
        bins = { "fd" },
        checks = { { "fd", "--version" } },
    },
    versions = {
        ["10.4.2"] = {
            revision = 3,
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
            inputs = {
                source = {
                    sha256 = "3a7e027af8c8e91c196ac259c703d78cd55c364706ddafbc66d02c326e57a456",
                },
            },
        },
        ["10.5.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "e6d9e90730bf316101691e49d59cc02565278dc3779d33a77423801569484851",
                },
            },
        },
    },
}
