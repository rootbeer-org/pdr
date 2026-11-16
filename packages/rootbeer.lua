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
            default_version = "0.1.0-main+69d4a0858be2",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+69d4a0858be2",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+69d4a0858be2",
        },
    },
    versions = {
        ["0.1.0-main+59d932ac27be"] = {
            digests = {
                ["aarch64-linux"] = "46dea2aace72aa6004b6785690845492c92b91b800b78633e5a118536fdc7313",
                ["aarch64-macos"] = "46dea2aace72aa6004b6785690845492c92b91b800b78633e5a118536fdc7313",
                ["x86_64-linux"] = "46dea2aace72aa6004b6785690845492c92b91b800b78633e5a118536fdc7313",
            },
            commit = "59d932ac27beac8092f117dca2a06191392d9381",
            serial = 20261115195341,
        },
        ["0.1.0-main+69d4a0858be2"] = {
            digests = {
                ["aarch64-linux"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
                ["aarch64-macos"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
                ["x86_64-linux"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
            },
            commit = "69d4a0858be27bf9438905db1bbdf5d3ca2cae3b",
            serial = 20261116194835,
        },
        ["0.1.0-main+c6fa6b98b1ef"] = {
            digests = {
                ["aarch64-linux"] = "62297ace605ba5ca7990159b0c5455c437dff0bd179e64e2577ef362d270183f",
                ["aarch64-macos"] = "62297ace605ba5ca7990159b0c5455c437dff0bd179e64e2577ef362d270183f",
                ["x86_64-linux"] = "62297ace605ba5ca7990159b0c5455c437dff0bd179e64e2577ef362d270183f",
            },
            commit = "c6fa6b98b1ef3a2c70984cc94a8e1e7465eb9d77",
            serial = 20261116004752,
        },
    },
}
