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
            default_version = "0.66.2",
        },
        ["aarch64-macos"] = {
            default_version = "0.66.2",
        },
        ["x86_64-linux"] = {
            default_version = "0.66.2",
        },
    },
    versions = {
        ["0.65.1"] = {
            digests = {
                ["aarch64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["aarch64-macos"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
                ["x86_64-linux"] = "df30ec1a5032b3c5672a30090fe787fb32d4122fd996d6d85e1d10135acfbc89",
            },
            revision = 4,
        },
        ["0.66.2"] = {
            digests = {
                ["aarch64-linux"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
                ["aarch64-macos"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
                ["x86_64-linux"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
            },
        },
    },
}
