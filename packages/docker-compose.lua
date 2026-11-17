return {
    name = "docker-compose",
    description = "Define and run multi-container Docker applications",
    homepage = "https://docs.docker.com/compose/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "docker/compose",
        repository_id = 15045751,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/docker/compose/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "compose-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                ["docker-compose"] = "./cmd",
            },
            variables = {
                ["github.com/docker/compose/v5/internal.Version"] = "v{version}",
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
        bins = { "docker-compose" },
        checks = {
            { "docker-compose", "version", "--short" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.8.0",
        },
        ["aarch64-macos"] = {
            default_version = "5.8.0",
        },
        ["x86_64-linux"] = {
            default_version = "5.8.0",
        },
    },
    versions = {
        ["5.7.1"] = {
            digests = {
                ["aarch64-linux"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
                ["aarch64-macos"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
                ["x86_64-linux"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
            },
        },
        ["5.8.0"] = {
            digests = {
                ["aarch64-linux"] = "1836019594ad054f8459cea7efc1d52eae7d05c64217c4efffe02d0d2930c44b",
                ["aarch64-macos"] = "1836019594ad054f8459cea7efc1d52eae7d05c64217c4efffe02d0d2930c44b",
                ["x86_64-linux"] = "1836019594ad054f8459cea7efc1d52eae7d05c64217c4efffe02d0d2930c44b",
            },
        },
    },
}
