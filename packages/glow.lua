return {
    name = "glow",
    description = "Read Markdown in the terminal",
    homepage = "https://github.com/charmbracelet/glow",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/charmbracelet/glow/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "glow-{version}",
    },
    build = {
        backend = "go",
        go = { binaries = { glow = "." }, variables = { ["main.Version"] = "{version}" } },
    },
    outputs = { bins = { "glow" }, checks = { { "glow", "--version" }, { "glow", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.0.0",
            upstream = {
                github = "charmbracelet/glow",
                repository_id = 219616873,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "3.0.0",
            upstream = {
                github = "charmbracelet/glow",
                repository_id = 219616873,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "3.0.0",
            upstream = {
                github = "charmbracelet/glow",
                repository_id = 219616873,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["3.0.0"] = {
            digests = {
                ["aarch64-linux"] = "18df6f3c09157021366b8c702b5badba405d37dbb42f132353eb50c1b0d3f464",
                ["aarch64-macos"] = "18df6f3c09157021366b8c702b5badba405d37dbb42f132353eb50c1b0d3f464",
                ["x86_64-linux"] = "18df6f3c09157021366b8c702b5badba405d37dbb42f132353eb50c1b0d3f464",
            },
            revision = 3,
        },
    },
}
