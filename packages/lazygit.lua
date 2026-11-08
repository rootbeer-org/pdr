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
            default_version = "0.66.3",
        },
        ["aarch64-macos"] = {
            default_version = "0.66.3",
        },
        ["x86_64-linux"] = {
            default_version = "0.66.3",
        },
    },
    versions = {
        ["0.66.2"] = {
            digests = {
                ["aarch64-linux"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
                ["aarch64-macos"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
                ["x86_64-linux"] = "fcaad0909af765ef87bd873164a4de78435515ab4d8b04f58d6ad51e8ecd00e5",
            },
        },
        ["0.66.3"] = {
            digests = {
                ["aarch64-linux"] = "49e80d28e03e53048105f6ebb5afefbe5caacffa8549347d8a59eab3a00dafe1",
                ["aarch64-macos"] = "49e80d28e03e53048105f6ebb5afefbe5caacffa8549347d8a59eab3a00dafe1",
                ["x86_64-linux"] = "49e80d28e03e53048105f6ebb5afefbe5caacffa8549347d8a59eab3a00dafe1",
            },
        },
    },
}
