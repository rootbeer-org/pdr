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
            default_version = "2.18.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.18.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.18.2",
        },
    },
    versions = {
        ["2.18.1"] = {
            digests = {
                ["aarch64-linux"] = "5f47712f272842b1b51f599403a266e1a304b9689cfb31da22bd279c79af5afc",
                ["aarch64-macos"] = "5f47712f272842b1b51f599403a266e1a304b9689cfb31da22bd279c79af5afc",
                ["x86_64-linux"] = "5f47712f272842b1b51f599403a266e1a304b9689cfb31da22bd279c79af5afc",
            },
            revision = 3,
        },
        ["2.18.2"] = {
            digests = {
                ["aarch64-linux"] = "aec0dee0c28739166cee8b81ef6f970cd90c02cf51687481a0c2ccc168f247f1",
                ["aarch64-macos"] = "aec0dee0c28739166cee8b81ef6f970cd90c02cf51687481a0c2ccc168f247f1",
                ["x86_64-linux"] = "aec0dee0c28739166cee8b81ef6f970cd90c02cf51687481a0c2ccc168f247f1",
            },
            revision = 2,
        },
    },
}
