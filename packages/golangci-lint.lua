return {
    name = "golangci-lint",
    description = "Run Go linters",
    homepage = "https://golangci-lint.run/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "golangci/golangci-lint",
        repository_id = 132145189,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/golangci/golangci-lint/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "golangci-lint-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                ["golangci-lint"] = "./cmd/golangci-lint",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "golangci-lint" },
        checks = {
            { "golangci-lint", "version" },
            { "golangci-lint", "help", "linters" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.13.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.13.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.13.2",
        },
    },
    versions = {
        ["2.13.2"] = {
            digests = {
                ["aarch64-linux"] = "a79a7a1faad9c1538e3f7f8b32843a53bbeedfa9ead45d9e8ca3bb210d55ece0",
                ["aarch64-macos"] = "a79a7a1faad9c1538e3f7f8b32843a53bbeedfa9ead45d9e8ca3bb210d55ece0",
                ["x86_64-linux"] = "a79a7a1faad9c1538e3f7f8b32843a53bbeedfa9ead45d9e8ca3bb210d55ece0",
            },
            revision = 3,
        },
    },
}
