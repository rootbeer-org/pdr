return {
    name = "fx",
    description = "View and process JSON in the terminal",
    homepage = "https://fx.wtf/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "antonmedv/fx",
        repository_id = 118945118,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/antonmedv/fx/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "fx-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                fx = ".",
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
        bins = { "fx" },
        checks = {
            { "fx", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "40.0.0",
        },
        ["aarch64-macos"] = {
            default_version = "40.0.0",
        },
        ["x86_64-linux"] = {
            default_version = "40.0.0",
        },
    },
    versions = {
        ["39.2.0"] = {
            digests = {
                ["aarch64-linux"] = "cdb98177f956615c961bc615fab0b30e73167295152d4f2d4cb70b16cdf47d6e",
                ["aarch64-macos"] = "cdb98177f956615c961bc615fab0b30e73167295152d4f2d4cb70b16cdf47d6e",
                ["x86_64-linux"] = "cdb98177f956615c961bc615fab0b30e73167295152d4f2d4cb70b16cdf47d6e",
            },
            revision = 2,
        },
        ["40.0.0"] = {
            digests = {
                ["aarch64-linux"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
                ["aarch64-macos"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
                ["x86_64-linux"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
            },
        },
    },
}
