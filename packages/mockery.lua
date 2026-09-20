return {
    schema = 2,
    name = "mockery",
    description = "Generate Go interface mocks",
    default_version = "3.8.0",
    homepage = "https://github.com/vektra/mockery",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "vektra/mockery",
        repository_id = 23586998,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/vektra/mockery/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "mockery-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { mockery = "." },
            variables = { ["github.com/vektra/mockery/v3/internal/logging.SemVer"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "mockery" },
        checks = { { "mockery", "version" }, { "mockery", "--help" } },
    },
    versions = {
        ["3.8.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "166487e34348d95057252e5a1a172d272f12eb01902c0c05c2a948567028800f",
                },
            },
        },
    },
}
