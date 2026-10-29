return {
    name = "mockery",
    description = "Generate Go interface mocks",
    homepage = "https://vektra.github.io/mockery/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "vektra/mockery",
        repository_id = 23586998,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/vektra/mockery/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "mockery-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                mockery = ".",
            },
            variables = {
                ["github.com/vektra/mockery/v3/internal/logging.SemVer"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "mockery" },
        checks = {
            { "mockery", "version" },
            { "mockery", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.9.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.9.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.9.0",
        },
    },
    versions = {
        ["3.8.1"] = {
            digests = {
                ["aarch64-linux"] = "6db3558b8c9f70b23458696b856d2207dcd7c0a48d02192ebcb10ee2e03924e4",
                ["aarch64-macos"] = "6db3558b8c9f70b23458696b856d2207dcd7c0a48d02192ebcb10ee2e03924e4",
                ["x86_64-linux"] = "6db3558b8c9f70b23458696b856d2207dcd7c0a48d02192ebcb10ee2e03924e4",
            },
        },
        ["3.9.0"] = {
            digests = {
                ["aarch64-linux"] = "43f36de92e81f167fde38dd5806b5e01e341f84e18e498686c7cd7197d9a4d29",
                ["aarch64-macos"] = "43f36de92e81f167fde38dd5806b5e01e341f84e18e498686c7cd7197d9a4d29",
                ["x86_64-linux"] = "43f36de92e81f167fde38dd5806b5e01e341f84e18e498686c7cd7197d9a4d29",
            },
        },
    },
}
