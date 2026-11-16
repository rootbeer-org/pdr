return {
    name = "goreleaser",
    description = "Build and package software releases",
    homepage = "https://goreleaser.com/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "goreleaser/goreleaser",
        repository_id = 77071454,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/goreleaser/goreleaser/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "goreleaser-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                goreleaser = ".",
            },
            variables = {
                ["main.builtBy"] = "Rootbeer",
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
        bins = { "goreleaser" },
        checks = {
            { "goreleaser", "--version" },
            { "goreleaser", "build", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.20.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.20.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.20.2",
        },
    },
    versions = {
        ["2.20.1"] = {
            digests = {
                ["aarch64-linux"] = "ae67dc2c731946a45cffa650899552c326ef5239375a6896f90812a4e51cf5be",
                ["aarch64-macos"] = "ae67dc2c731946a45cffa650899552c326ef5239375a6896f90812a4e51cf5be",
                ["x86_64-linux"] = "ae67dc2c731946a45cffa650899552c326ef5239375a6896f90812a4e51cf5be",
            },
        },
        ["2.20.2"] = {
            digests = {
                ["aarch64-linux"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
                ["aarch64-macos"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
                ["x86_64-linux"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
            },
        },
    },
}
