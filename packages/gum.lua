return {
    schema = 2,
    name = "gum",
    description = "Build interactive shell scripts",
    default_version = "2.0.1",
    homepage = "https://github.com/charmbracelet/gum",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "charmbracelet/gum",
        repository_id = 502193049,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/charmbracelet/gum/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "gum-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { gum = "." },
            variables = { ["main.Version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "gum" },
        checks = { { "gum", "--version" }, { "gum", "format", "hello" } },
    },
    versions = {
        ["2.0.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2cbc41662ff6c8df30ff3f6c133d4276db72a6f9b3df7eb942f1a798bcbf3d80",
                },
            },
        },
    },
}
