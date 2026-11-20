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
            default_version = "2.20.3",
        },
        ["aarch64-macos"] = {
            default_version = "2.20.3",
        },
        ["x86_64-linux"] = {
            default_version = "2.20.3",
        },
    },
    versions = {
        ["2.20.2"] = {
            digests = {
                ["aarch64-linux"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
                ["aarch64-macos"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
                ["x86_64-linux"] = "04c2bd59e77630c1a570d371d1bfe1849688df8686576eec7248322d1fa022a8",
            },
        },
        ["2.20.3"] = {
            digests = {
                ["aarch64-linux"] = "fadad66017a322e36d9bef5d70ad5c37d7239db28dc84b5f79590572471d1091",
                ["aarch64-macos"] = "fadad66017a322e36d9bef5d70ad5c37d7239db28dc84b5f79590572471d1091",
                ["x86_64-linux"] = "fadad66017a322e36d9bef5d70ad5c37d7239db28dc84b5f79590572471d1091",
            },
        },
    },
}
