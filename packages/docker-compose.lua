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
            default_version = "5.6.1",
        },
        ["aarch64-macos"] = {
            default_version = "5.6.1",
        },
        ["x86_64-linux"] = {
            default_version = "5.6.1",
        },
    },
    versions = {
        ["5.6.0"] = {
            digests = {
                ["aarch64-linux"] = "51ad60cc28d38a0850678053f0a259dfee931d150dd1d50ee9e6d758125b1d47",
                ["aarch64-macos"] = "51ad60cc28d38a0850678053f0a259dfee931d150dd1d50ee9e6d758125b1d47",
                ["x86_64-linux"] = "51ad60cc28d38a0850678053f0a259dfee931d150dd1d50ee9e6d758125b1d47",
            },
        },
        ["5.6.1"] = {
            digests = {
                ["aarch64-linux"] = "bd1318503f131bc7f02538f153a7ead52f27ea30a99aee09f153a5dab9e6230a",
                ["aarch64-macos"] = "bd1318503f131bc7f02538f153a7ead52f27ea30a99aee09f153a5dab9e6230a",
                ["x86_64-linux"] = "bd1318503f131bc7f02538f153a7ead52f27ea30a99aee09f153a5dab9e6230a",
            },
        },
    },
}
