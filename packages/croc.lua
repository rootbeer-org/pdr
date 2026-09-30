return {
    name = "croc",
    description = "Send files between computers securely",
    homepage = "https://github.com/schollz/croc",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "schollz/croc",
        repository_id = 107286889,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/schollz/croc/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "croc-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                croc = ".",
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
        bins = { "croc" },
        checks = {
            { "croc", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "11.5.4",
        },
        ["aarch64-macos"] = {
            default_version = "11.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "11.5.4",
        },
    },
    versions = {
        ["11.5.4"] = {
            digests = {
                ["aarch64-linux"] = "16910b594704b40e9df35eb3bc637db675fe3d770a4588bd32b5a12c5ff174ff",
                ["aarch64-macos"] = "16910b594704b40e9df35eb3bc637db675fe3d770a4588bd32b5a12c5ff174ff",
                ["x86_64-linux"] = "16910b594704b40e9df35eb3bc637db675fe3d770a4588bd32b5a12c5ff174ff",
            },
            revision = 2,
        },
    },
}
