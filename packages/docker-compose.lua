return {
    schema = 2,
    name = "docker-compose",
    description = "Define and run multi-container Docker applications",
    default_version = "5.5.1",
    homepage = "https://docs.docker.com/compose/",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "docker/compose",
        repository_id = 15045751,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/docker/compose/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "compose-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { ["docker-compose"] = "./cmd" },
            variables = { ["github.com/docker/compose/v5/internal.Version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "docker-compose" },
        checks = { { "docker-compose", "version", "--short" } },
    },
    versions = {
        ["5.5.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "311077662698fd8e34769a894f9d5240befb1730990efa8ed58e0fa8725d2d84",
                },
            },
        },
    },
}
