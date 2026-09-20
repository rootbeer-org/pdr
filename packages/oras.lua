return {
    schema = 2,
    name = "oras",
    description = "Push and pull OCI registry artifacts",
    default_version = "1.3.4",
    homepage = "https://github.com/oras-project/oras",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "oras-project/oras",
        repository_id = 162945532,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/oras-project/oras/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "oras-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { oras = "./cmd/oras" },
            variables = {
                ["oras.land/oras/internal/version.Version"] = "{version}",
                ["oras.land/oras/internal/version.BuildMetadata"] = "",
            },
        },
    },
    outputs = {
        bins = { "oras" },
        checks = { { "oras", "version" }, { "oras", "manifest", "--help" } },
    },
    versions = {
        ["1.3.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "0967062b09d82c902e7f6bdd22fc6dd4577811bf46ba63dab8791ff047c55392",
                },
            },
        },
    },
}
