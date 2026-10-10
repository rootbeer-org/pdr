return {
    name = "lazygit",
    description = "Manage Git repositories in a terminal interface",
    homepage = "https://github.com/jesseduffield/lazygit",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "jesseduffield/lazygit",
        repository_id = 134017286,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/jesseduffield/lazygit/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "lazygit-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                lazygit = ".",
            },
            variables = {
                ["main.buildSource"] = "Rootbeer",
                ["main.version"] = "{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "lazygit" },
        checks = {
            { "lazygit", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.66.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.66.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.66.0",
        },
    },
    versions = {
        ["0.65.0"] = {
            digests = {
                ["aarch64-linux"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
                ["aarch64-macos"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
                ["x86_64-linux"] = "972151d83d8fdfa5c7c881c34349ba4a38c37b7085667696b85c443d2fca97ed",
            },
            revision = 4,
        },
        ["0.65.1"] = {
            digests = {
                ["aarch64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["aarch64-macos"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["x86_64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
            },
            revision = 4,
        },
        ["0.66.0"] = {
            digests = {
                ["aarch64-linux"] = "704b14509dae4c0212754d60d1c00181aea79c0734aafa2c83c89301dba1aefd",
                ["aarch64-macos"] = "704b14509dae4c0212754d60d1c00181aea79c0734aafa2c83c89301dba1aefd",
                ["x86_64-linux"] = "704b14509dae4c0212754d60d1c00181aea79c0734aafa2c83c89301dba1aefd",
            },
        },
    },
}
