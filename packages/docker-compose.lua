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
            default_version = "5.7.1",
        },
        ["aarch64-macos"] = {
            default_version = "5.7.1",
        },
        ["x86_64-linux"] = {
            default_version = "5.7.1",
        },
    },
    versions = {
        ["5.7.0"] = {
            digests = {
                ["aarch64-linux"] = "98f5b7dd4a66d8a2d9289e918fa0f63e5ff9821623950e53e633571a78b30d63",
                ["aarch64-macos"] = "98f5b7dd4a66d8a2d9289e918fa0f63e5ff9821623950e53e633571a78b30d63",
                ["x86_64-linux"] = "98f5b7dd4a66d8a2d9289e918fa0f63e5ff9821623950e53e633571a78b30d63",
            },
        },
        ["5.7.1"] = {
            digests = {
                ["aarch64-linux"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
                ["aarch64-macos"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
                ["x86_64-linux"] = "bd108789759d3e17ae5532dd6eee67b427dade4c85089daa2f85d6c8f3e3ccb6",
            },
        },
    },
}
