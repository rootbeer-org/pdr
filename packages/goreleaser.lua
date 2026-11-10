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
            default_version = "2.20.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.20.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.20.0",
        },
    },
    versions = {
        ["2.19.0"] = {
            digests = {
                ["aarch64-linux"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
                ["aarch64-macos"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
                ["x86_64-linux"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
            },
        },
        ["2.20.0"] = {
            digests = {
                ["aarch64-linux"] = "4365a8112344b9c9c227873d3a2071f596db6056ad8a86b47467728856f7afea",
                ["aarch64-macos"] = "4365a8112344b9c9c227873d3a2071f596db6056ad8a86b47467728856f7afea",
                ["x86_64-linux"] = "4365a8112344b9c9c227873d3a2071f596db6056ad8a86b47467728856f7afea",
            },
        },
    },
}
