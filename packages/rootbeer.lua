return {
    name = "rootbeer",
    aliases = { "rb" },
    description = "Declarative system configuration and package tooling in Lua",
    homepage = "https://rbpkg.com",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/{commit}",
        git = {
            github = "rootbeer-org/rootbeer",
            branch = "main",
        },
        archive = "tar.gz",
        strip_prefix = "rootbeer-{commit}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", version = "1.98.1", kind = "build" },
        },
        rust = {
            packages = { "rootbeer-cli", "rootbeer-helper" },
            environment = {
                RB_SOURCE_REVISION = "{commit}",
            },
        },
    },
    outputs = {
        bins = { "rb", "rb-helper" },
        checks = {
            { "rb", "--version" },
            { "rb", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0-main+b820fd9d86aa",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+b820fd9d86aa",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+b820fd9d86aa",
        },
    },
    versions = {
        ["0.1.0-main+890f984cb804"] = {
            digests = {
                ["aarch64-linux"] = "ba7af4723aafe98f44479ccf16b308132f19344a1bf1c1cc7d5c02bda8d8ea75",
                ["aarch64-macos"] = "ba7af4723aafe98f44479ccf16b308132f19344a1bf1c1cc7d5c02bda8d8ea75",
                ["x86_64-linux"] = "ba7af4723aafe98f44479ccf16b308132f19344a1bf1c1cc7d5c02bda8d8ea75",
            },
            commit = "890f984cb8045e3dbb1808eeddc6f8a0af13ffb2",
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", version = "1.98.1", kind = "build" },
                },
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-helper" },
                    environment = {
                        RB_SERIAL = "20261019032056",
                        RB_SOURCE_REVISION = "{commit}",
                    },
                },
            },
            outputs = {
                bins = { "rb", "rb-helper" },
                checks = {
                    { "rb", "--version" },
                    { "rb", "--help" },
                },
            },
        },
        ["0.1.0-main+b820fd9d86aa"] = {
            digests = {
                ["aarch64-linux"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
                ["aarch64-macos"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
                ["x86_64-linux"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
            },
            commit = "b820fd9d86aa7f1c8d0c9676c28b14964672372b",
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", version = "1.98.1", kind = "build" },
                },
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-helper" },
                    environment = {
                        RB_SERIAL = "20261019171758",
                        RB_SOURCE_REVISION = "{commit}",
                    },
                },
            },
            outputs = {
                bins = { "rb", "rb-helper" },
                checks = {
                    { "rb", "--version" },
                    { "rb", "--help" },
                },
            },
        },
        ["0.1.0-main+eaa97b85c59d"] = {
            digests = {
                ["aarch64-linux"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
                ["aarch64-macos"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
                ["x86_64-linux"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
            },
            commit = "eaa97b85c59dd21cfecf0db952b04ae393f94404",
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", version = "1.98.1", kind = "build" },
                },
                rust = {
                    packages = { "rootbeer-cli", "rootbeer-helper" },
                    environment = {
                        RB_SERIAL = "20261019153818",
                        RB_SOURCE_REVISION = "{commit}",
                    },
                },
            },
            outputs = {
                bins = { "rb", "rb-helper" },
                checks = {
                    { "rb", "--version" },
                    { "rb", "--help" },
                },
            },
        },
    },
}
