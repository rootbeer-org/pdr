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
            default_version = "2.74.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.74.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.74.0",
        },
    },
    versions = {
        ["2.73.3"] = {
            digests = {
                ["aarch64-linux"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
                ["aarch64-macos"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
                ["x86_64-linux"] = "5bee6b243331b9c02a7f25ca1696bbde30cb3909c8bccb91108f2718931e4fc7",
            },
        },
        ["2.74.0"] = {
            digests = {
                ["aarch64-linux"] = "58ecb38aae54e1852f918adae1260a84bb4d750181e093439e621c921acbee49",
                ["aarch64-macos"] = "58ecb38aae54e1852f918adae1260a84bb4d750181e093439e621c921acbee49",
                ["x86_64-linux"] = "58ecb38aae54e1852f918adae1260a84bb4d750181e093439e621c921acbee49",
            },
        },
    },
}
