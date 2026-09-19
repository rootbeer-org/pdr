return {
    schema = 2,
    name = "choose",
    description = "Select fields and ranges from text",
    default_version = "1.3.7",
    homepage = "https://github.com/theryangeary/choose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "theryangeary/choose",
        repository_id = 207951619,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "choose" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/theryangeary/choose/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "choose-{version}",
        },
    },
    outputs = {
        bins = { "choose" },
        checks = { { "choose", "--version" }, { "choose", "--help" } },
    },
    versions = {
        ["1.3.7"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "8f51a315fbbe0688c4a2078ba8bc8446d36943b6cce6ed9bbd6a11f33bd1a134",
                },
            },
        },
    },
}
