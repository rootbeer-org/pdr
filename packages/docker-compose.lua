return {
    name = "docker-compose",
    description = "Define and run multi-container Docker applications",
    homepage = "https://docs.docker.com/compose/",
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
    },
    outputs = {
        bins = { "docker-compose" },
        checks = {
            { "docker-compose", "version", "--short" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.5.1",
        },
        ["aarch64-macos"] = {
            default_version = "5.5.1",
        },
        ["x86_64-linux"] = {
            default_version = "5.5.1",
        },
    },
    versions = {
        ["5.5.1"] = {
            digests = {
                ["aarch64-linux"] = "311077662698fd8e34769a894f9d5240befb1730990efa8ed58e0fa8725d2d84",
                ["aarch64-macos"] = "311077662698fd8e34769a894f9d5240befb1730990efa8ed58e0fa8725d2d84",
                ["x86_64-linux"] = "311077662698fd8e34769a894f9d5240befb1730990efa8ed58e0fa8725d2d84",
            },
            revision = 3,
        },
    },
}
