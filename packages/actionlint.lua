return {
    name = "actionlint",
    description = "Check GitHub Actions workflows",
    homepage = "https://github.com/rhysd/actionlint",
    default_license = "MIT",
    upstream = {
        github = "rhysd/actionlint",
        repository_id = 370668507,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/rhysd/actionlint/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "actionlint-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                actionlint = "./cmd/actionlint",
            },
            variables = {
                ["github.com/rhysd/actionlint.installedFrom"] = "built by Rootbeer",
                ["github.com/rhysd/actionlint.version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "actionlint" },
        checks = {
            { "actionlint", "-version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.7.12",
        },
        ["aarch64-macos"] = {
            default_version = "1.7.12",
        },
        ["x86_64-linux"] = {
            default_version = "1.7.12",
        },
    },
    versions = {
        ["1.7.12"] = {
            digests = {
                ["aarch64-linux"] = "454800bd4f854592bcfe79b161f71d56e35940eb7016e48a26dd356adc9d400a",
                ["aarch64-macos"] = "454800bd4f854592bcfe79b161f71d56e35940eb7016e48a26dd356adc9d400a",
                ["x86_64-linux"] = "454800bd4f854592bcfe79b161f71d56e35940eb7016e48a26dd356adc9d400a",
            },
            revision = 3,
        },
    },
}
