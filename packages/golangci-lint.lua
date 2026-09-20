return {
    schema = 2,
    name = "golangci-lint",
    description = "Run Go linters",
    default_version = "2.13.2",
    homepage = "https://github.com/golangci/golangci-lint",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "golangci/golangci-lint",
        repository_id = 132145189,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/golangci/golangci-lint/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "golangci-lint-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { ["golangci-lint"] = "./cmd/golangci-lint" },
            variables = { ["main.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "golangci-lint" },
        checks = { { "golangci-lint", "version" }, { "golangci-lint", "help", "linters" } },
    },
    versions = {
        ["2.13.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "a79a7a1faad9c1538e3f7f8b32843a53bbeedfa9ead45d9e8ca3bb210d55ece0",
                },
            },
        },
    },
}
