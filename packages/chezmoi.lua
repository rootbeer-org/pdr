return {
    name = "chezmoi",
    description = "Manage dotfiles across machines",
    homepage = "https://github.com/twpayne/chezmoi",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/twpayne/chezmoi/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "chezmoi-{version}",
    },
    build = {
        backend = "go",
        go = { binaries = { chezmoi = "." }, variables = { ["main.version"] = "{version}" } },
    },
    outputs = { bins = { "chezmoi" }, checks = { { "chezmoi", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.72.2",
            upstream = { github = "twpayne/chezmoi", repository_id = 157245200, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "2.72.2",
            upstream = { github = "twpayne/chezmoi", repository_id = 157245200, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "2.72.2",
            upstream = { github = "twpayne/chezmoi", repository_id = 157245200, tag_prefix = "v" },
        },
    },
    versions = {
        ["2.72.1"] = {
            digests = {
                ["aarch64-linux"] = "52a2fbff0c11285bac91b9267bce0f48069153c111890debf61836953dfcbca8",
                ["aarch64-macos"] = "52a2fbff0c11285bac91b9267bce0f48069153c111890debf61836953dfcbca8",
                ["x86_64-linux"] = "52a2fbff0c11285bac91b9267bce0f48069153c111890debf61836953dfcbca8",
            },
            revision = 3,
        },
        ["2.72.2"] = {
            digests = {
                ["aarch64-linux"] = "977c779f616ebf3d49700ceca426d61f367e2850ff397d3ae95ca32d7f954309",
                ["aarch64-macos"] = "977c779f616ebf3d49700ceca426d61f367e2850ff397d3ae95ca32d7f954309",
                ["x86_64-linux"] = "977c779f616ebf3d49700ceca426d61f367e2850ff397d3ae95ca32d7f954309",
            },
            revision = 3,
        },
    },
}
