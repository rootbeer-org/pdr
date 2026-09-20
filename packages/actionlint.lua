return {
    schema = 2,
    name = "actionlint",
    description = "Check GitHub Actions workflows",
    default_version = "1.7.12",
    homepage = "https://github.com/rhysd/actionlint",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "rhysd/actionlint",
        repository_id = 370668507,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/rhysd/actionlint/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "actionlint-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { actionlint = "./cmd/actionlint" },
            variables = {
                ["github.com/rhysd/actionlint.version"] = "{version}",
                ["github.com/rhysd/actionlint.installedFrom"] = "built by Rootbeer",
            },
        },
    },
    outputs = {
        bins = { "actionlint" },
        checks = { { "actionlint", "-version" } },
    },
    versions = {
        ["1.7.12"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "454800bd4f854592bcfe79b161f71d56e35940eb7016e48a26dd356adc9d400a",
                },
            },
        },
    },
}
