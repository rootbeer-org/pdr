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
            default_version = "40.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "40.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "40.0.2",
        },
    },
    versions = {
        ["40.0.1"] = {
            digests = {
                ["aarch64-linux"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
                ["aarch64-macos"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
                ["x86_64-linux"] = "311ca3f2ac2fe951c1f662b52e9fbf5ceeed74a2b7c52e8aa98c30001c2ffbb2",
            },
        },
        ["40.0.2"] = {
            digests = {
                ["aarch64-linux"] = "1bfb6664c0adba8ff12618e7dd9334921f3c9e5e41c7724027c0949fce826347",
                ["aarch64-macos"] = "1bfb6664c0adba8ff12618e7dd9334921f3c9e5e41c7724027c0949fce826347",
                ["x86_64-linux"] = "1bfb6664c0adba8ff12618e7dd9334921f3c9e5e41c7724027c0949fce826347",
            },
        },
    },
}
