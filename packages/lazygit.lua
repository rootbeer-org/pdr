return {
    schema = 2,
    name = "lazygit",
    description = "Manage Git repositories in a terminal",
    default_version = "0.65.1",
    homepage = "https://github.com/jesseduffield/lazygit",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "jesseduffield/lazygit",
        repository_id = 134017286,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/jesseduffield/lazygit/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "lazygit-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { lazygit = "." },
            variables = { ["main.version"] = "{version}", ["main.buildSource"] = "Rootbeer" },
        },
    },
    outputs = {
        bins = { "lazygit" },
        checks = { { "lazygit", "--version" } },
    },
    versions = {
        ["0.65.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
                },
            },
        },
        ["0.65.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                },
            },
        },
    },
}
