return {
    schema = 2,
    name = "goreleaser",
    description = "Build and package software releases",
    homepage = "https://github.com/goreleaser/goreleaser",
    default_version = "2.18.2",
    upstream = {
        github = "goreleaser/goreleaser",
        repository_id = 77071454,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/goreleaser/goreleaser/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "goreleaser-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { goreleaser = "." },
            variables = { ["main.version"] = "{version}", ["main.builtBy"] = "Rootbeer" },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "goreleaser" },
        checks = {
            { "goreleaser", "--version" },
            { "goreleaser", "build", "--help" },
        },
    },
    versions = {
        ["2.18.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "5f47712f272842b1b51f599403a266e1a304b9689cfb31da22bd279c79af5afc",
                },
            },
        },
        ["2.18.2"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "aec0dee0c28739166cee8b81ef6f970cd90c02cf51687481a0c2ccc168f247f1",
                },
            },
        },
    },
}
