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
            default_version = "1.3.6",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.6",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.6",
        },
    },
    versions = {
        ["1.3.4"] = {
            digests = {
                ["aarch64-linux"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
                ["aarch64-macos"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
                ["x86_64-linux"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
            },
            revision = 4,
        },
        ["1.3.6"] = {
            digests = {
                ["aarch64-linux"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
                ["aarch64-macos"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
                ["x86_64-linux"] = "9a67269f475019a07384bd73004ca308c221674aea0d0dc48e059c61b09bcd54",
            },
        },
    },
}
