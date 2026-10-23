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
            default_version = "2.19.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.19.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.19.0",
        },
    },
    versions = {
        ["2.18.3"] = {
            digests = {
                ["aarch64-linux"] = "c9171b55aebb257d2c46fa8fc3d48b5062a725f8ebbfb9f746d8b80225bae800",
                ["aarch64-macos"] = "c9171b55aebb257d2c46fa8fc3d48b5062a725f8ebbfb9f746d8b80225bae800",
                ["x86_64-linux"] = "c9171b55aebb257d2c46fa8fc3d48b5062a725f8ebbfb9f746d8b80225bae800",
            },
        },
        ["2.19.0"] = {
            digests = {
                ["aarch64-linux"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
                ["aarch64-macos"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
                ["x86_64-linux"] = "e3ee2127b873da8146e697b97c91d878ed6cd2f49d645639b3b473d9043b9318",
            },
        },
    },
}
