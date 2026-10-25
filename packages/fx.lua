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
            default_version = "40.0.1",
        },
        ["aarch64-macos"] = {
            default_version = "40.0.1",
        },
        ["x86_64-linux"] = {
            default_version = "40.0.1",
        },
    },
    versions = {
        ["40.0.0"] = {
            digests = {
                ["aarch64-linux"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
                ["aarch64-macos"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
                ["x86_64-linux"] = "92e5ade859952bc79a3c68492803ce0af25a7332c78c4a0e1914da302d88b478",
            },
        },
        ["40.0.1"] = {
            digests = {
                ["aarch64-linux"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
                ["aarch64-macos"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
                ["x86_64-linux"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
            },
        },
    },
}
