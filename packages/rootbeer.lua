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
                RB_SERIAL = "{serial}",
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
            default_version = "0.1.0-main+c123f04de849",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+c123f04de849",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+c123f04de849",
        },
    },
    versions = {
        ["0.1.0-main+b820fd9d86aa"] = {
            digests = {
                ["aarch64-linux"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
                ["aarch64-macos"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
                ["x86_64-linux"] = "2318adfbb486b0eaa9e8bbed56fa23ee9811377959f0710ea56cbc549de108d3",
            },
            commit = "b820fd9d86aa7f1c8d0c9676c28b14964672372b",
            serial = 20261019171758,
        },
        ["0.1.0-main+c123f04de849"] = {
            digests = {
                ["aarch64-linux"] = "7ea9256e8599499e28b4218992886d71273e7d690857a0b259de5e3ed68bf454",
                ["aarch64-macos"] = "7ea9256e8599499e28b4218992886d71273e7d690857a0b259de5e3ed68bf454",
                ["x86_64-linux"] = "7ea9256e8599499e28b4218992886d71273e7d690857a0b259de5e3ed68bf454",
            },
            commit = "c123f04de849e3a996d9a0cfad46c1e09e217a7c",
            serial = 20261020000720,
        },
        ["0.1.0-main+eaa97b85c59d"] = {
            digests = {
                ["aarch64-linux"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
                ["aarch64-macos"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
                ["x86_64-linux"] = "d722ac7c9a7ebcc21f8e44ba6d16c8526b6a644e3112b0ac2423e55d258803b9",
            },
            commit = "eaa97b85c59dd21cfecf0db952b04ae393f94404",
            serial = 20261019153818,
        },
    },
}
