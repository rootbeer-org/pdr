return {
    name = "mockery",
    description = "Generate Go interface mocks",
    homepage = "https://github.com/vektra/mockery",
    default_license = "BSD-3-Clause",
    source = {
        url = "https://codeload.github.com/vektra/mockery/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "mockery-{version}",
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
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.0",
            upstream = { github = "vektra/mockery", repository_id = 23586998, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "3.8.0",
            upstream = { github = "vektra/mockery", repository_id = 23586998, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "3.8.0",
            upstream = { github = "vektra/mockery", repository_id = 23586998, tag_prefix = "v" },
        },
    },
    versions = {
        ["3.8.0"] = {
            digests = {
                ["aarch64-linux"] = "166487e34348d95057252e5a1a172d272f12eb01902c0c05c2a948567028800f",
                ["aarch64-macos"] = "166487e34348d95057252e5a1a172d272f12eb01902c0c05c2a948567028800f",
                ["x86_64-linux"] = "166487e34348d95057252e5a1a172d272f12eb01902c0c05c2a948567028800f",
            },
            revision = 3,
        },
    },
}
