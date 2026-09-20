return {
    schema = 2,
    name = "chezmoi",
    description = "Manage dotfiles across machines",
    default_version = "2.72.2",
    homepage = "https://github.com/twpayne/chezmoi",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "twpayne/chezmoi",
        repository_id = 157245200,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/twpayne/chezmoi/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "chezmoi-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { chezmoi = "." },
            variables = { ["main.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "chezmoi" },
        checks = { { "chezmoi", "--version" } },
    },
    versions = {
        ["2.72.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "52a2fbff0c11285bac91b9267bce0f48069153c111890debf61836953dfcbca8",
                },
            },
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["2.72.2"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "977c779f616ebf3d49700ceca426d61f367e2850ff397d3ae95ca32d7f954309",
                },
            },
        },
    },
}
