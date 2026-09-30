return {
    name = "gofumpt",
    description = "Format Go code more strictly than gofmt",
    homepage = "https://github.com/mvdan/gofumpt",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "mvdan/gofumpt",
        repository_id = 178628673,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/mvdan/gofumpt/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "gofumpt-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gofumpt = ".",
            },
            variables = {
                ["main.version"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "gofumpt" },
        checks = {
            { "gofumpt", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.12.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.12.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.12.0",
        },
    },
    versions = {
        ["0.12.0"] = {
            digests = {
                ["aarch64-linux"] = "b6d5d14692cad23996da4329bf24d30324af30125dd5261e6d9b0c5bc8b20b28",
                ["aarch64-macos"] = "b6d5d14692cad23996da4329bf24d30324af30125dd5261e6d9b0c5bc8b20b28",
                ["x86_64-linux"] = "b6d5d14692cad23996da4329bf24d30324af30125dd5261e6d9b0c5bc8b20b28",
            },
            revision = 2,
        },
    },
}
