return {
    name = "lazygit",
    description = "Manage Git repositories in a terminal",
    homepage = "https://github.com/jesseduffield/lazygit",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/jesseduffield/lazygit/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "lazygit-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { lazygit = "." },
            variables = { ["main.buildSource"] = "Rootbeer", ["main.version"] = "{version}" },
        },
    },
    outputs = { bins = { "lazygit" }, checks = { { "lazygit", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.65.1",
            upstream = {
                github = "jesseduffield/lazygit",
                repository_id = 134017286,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.65.1",
            upstream = {
                github = "jesseduffield/lazygit",
                repository_id = 134017286,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "0.65.1",
            upstream = {
                github = "jesseduffield/lazygit",
                repository_id = 134017286,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["0.65.0"] = {
            digests = {
                ["aarch64-linux"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
                ["aarch64-macos"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
                ["x86_64-linux"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
            },
            revision = 3,
        },
        ["0.65.1"] = {
            digests = {
                ["aarch64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["aarch64-macos"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["x86_64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
            },
            revision = 3,
        },
    },
}
