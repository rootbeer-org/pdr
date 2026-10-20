return {
    name = "chezmoi",
    description = "Manage dotfiles across machines",
    homepage = "https://www.chezmoi.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "twpayne/chezmoi",
        repository_id = 157245200,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/twpayne/chezmoi/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "chezmoi-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                chezmoi = ".",
            },
            variables = {
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
        bins = { "chezmoi" },
        checks = {
            { "chezmoi", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.73.3",
        },
        ["aarch64-macos"] = {
            default_version = "2.73.3",
        },
        ["x86_64-linux"] = {
            default_version = "2.73.3",
        },
    },
    versions = {
        ["2.73.0"] = {
            digests = {
                ["aarch64-linux"] = "f6fba40bec4662d5438eecce5cd5c1bcad0bcae5ec34a547fdcf66fb58535764",
                ["aarch64-macos"] = "f6fba40bec4662d5438eecce5cd5c1bcad0bcae5ec34a547fdcf66fb58535764",
                ["x86_64-linux"] = "f6fba40bec4662d5438eecce5cd5c1bcad0bcae5ec34a547fdcf66fb58535764",
            },
        },
        ["2.73.3"] = {
            digests = {
                ["aarch64-linux"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
                ["aarch64-macos"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
                ["x86_64-linux"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
            },
        },
    },
}
