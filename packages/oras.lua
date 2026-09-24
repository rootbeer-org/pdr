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
            default_version = "1.3.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.3.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.3.4",
        },
    },
    versions = {
        ["1.3.4"] = {
            digests = {
                ["aarch64-linux"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
                ["aarch64-macos"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
                ["x86_64-linux"] = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
            },
            revision = 3,
        },
    },
}
