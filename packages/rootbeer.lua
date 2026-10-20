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
            default_version = "0.1.0-main+37309db196dd",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+37309db196dd",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+37309db196dd",
        },
    },
    versions = {
        ["0.1.0-main+37309db196dd"] = {
            digests = {
                ["aarch64-linux"] = "37a43156943a73a23cefba24cd22c34763b664ffec13a9832d6fd3f21033fae2",
                ["aarch64-macos"] = "37a43156943a73a23cefba24cd22c34763b664ffec13a9832d6fd3f21033fae2",
                ["x86_64-linux"] = "37a43156943a73a23cefba24cd22c34763b664ffec13a9832d6fd3f21033fae2",
            },
            commit = "37309db196dd31f9d70f360361fa18191f9b92ec",
            serial = 20261020064828,
        },
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
    },
}
