return {
    name = "oras",
    description = "Push and pull OCI registry artifacts",
    homepage = "https://oras.land",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "oras-project/oras",
        repository_id = 162945532,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/oras-project/oras/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "oras-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                oras = "./cmd/oras",
            },
            variables = {
                ["oras.land/oras/internal/version.BuildMetadata"] = "",
                ["oras.land/oras/internal/version.Version"] = "{version}",
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
        bins = { "oras" },
        checks = {
            { "oras", "version" },
            { "oras", "manifest", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.0",
        },
    },
    versions = {
        ["1.3.6"] = {
            digests = {
                ["aarch64-linux"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
                ["aarch64-macos"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
                ["x86_64-linux"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
            },
        },
        ["1.4.0"] = {
            digests = {
                ["aarch64-linux"] = "453bda1279b166eb6c2bd84b5995b952403c388ad8eb2f77a9f269011f69788b",
                ["aarch64-macos"] = "453bda1279b166eb6c2bd84b5995b952403c388ad8eb2f77a9f269011f69788b",
                ["x86_64-linux"] = "453bda1279b166eb6c2bd84b5995b952403c388ad8eb2f77a9f269011f69788b",
            },
        },
    },
}
