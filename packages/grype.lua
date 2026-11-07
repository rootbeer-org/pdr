return {
    name = "grype",
    description = "Find vulnerabilities in images and filesystems",
    homepage = "https://github.com/anchore/grype",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "anchore/grype",
        repository_id = 267054247,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/anchore/grype/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "grype-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                grype = "./cmd/grype",
            },
            variables = {
                ["main.version"] = "{version}",
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
        bins = { "grype" },
        checks = {
            { "grype", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.121.2",
        },
        ["aarch64-macos"] = {
            default_version = "0.121.2",
        },
        ["x86_64-linux"] = {
            default_version = "0.121.2",
        },
    },
    versions = {
        ["0.121.0"] = {
            digests = {
                ["aarch64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["aarch64-macos"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
                ["x86_64-linux"] = "87244bc41b3fbd596d12f31f2f0e335d36c1059662f27baa31036584e427d169",
            },
        },
        ["0.121.2"] = {
            digests = {
                ["aarch64-linux"] = "1b68dc6388cbf5287a7b055bf67b2c68e39a5f7abd159b0e2a1d155d3e89ccb2",
                ["aarch64-macos"] = "1b68dc6388cbf5287a7b055bf67b2c68e39a5f7abd159b0e2a1d155d3e89ccb2",
                ["x86_64-linux"] = "1b68dc6388cbf5287a7b055bf67b2c68e39a5f7abd159b0e2a1d155d3e89ccb2",
            },
        },
    },
}
