return {
    schema = 2,
    name = "glow",
    description = "Read Markdown in the terminal",
    default_version = "3.0.0",
    homepage = "https://github.com/charmbracelet/glow",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "charmbracelet/glow",
        repository_id = 219616873,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/charmbracelet/glow/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "glow-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { glow = "." },
            variables = { ["main.Version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "glow" },
        checks = { { "glow", "--version" }, { "glow", "--help" } },
    },
    versions = {
        ["3.0.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "18df6f3c09157021366b8c702b5badba405d37dbb42f132353eb50c1b0d3f464",
                },
            },
        },
    },
}
