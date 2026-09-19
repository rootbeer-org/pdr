return {
    schema = 2,
    name = "dust",
    description = "Inspect directory disk usage",
    homepage = "https://github.com/bootandy/dust",
    default_version = "1.2.6",
    upstream = {
        github = "bootandy/dust",
        repository_id = 125563061,
        tag_prefix = "v",
        exclude_tags = { "v0.8.1-alpha.2", "v0.8.1-alpha.1", "untagged-1499119fdec1dec70238" },
    },
    build = {
        backend = "rust",
        rust = { packages = { "du-dust" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/bootandy/dust/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "dust-{version}",
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "dust" },
        checks = {
            { "dust", "--version" },
        },
    },
    versions = {
        ["1.2.5"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "4445e61f1341ea567e9e49367f275a1f4b026a60526e60048265f7af4a4943fd",
                },
            },
        },
        ["1.2.6"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "9dd1ec7576d43574e6f48342cb96a5087338b4c308460a848f5895f72ddc3bc9",
                },
            },
        },
    },
}
