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
            default_version = "0.1.0-main+bab09313225a",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+bab09313225a",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+bab09313225a",
        },
    },
    versions = {
        ["0.1.0-main+69d4a0858be2"] = {
            digests = {
                ["aarch64-linux"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
                ["aarch64-macos"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
                ["x86_64-linux"] = "e893c589ffeb043fae7299e89ec14023198441bd0a96a6f2d567dc484c89f02c",
            },
            commit = "69d4a0858be27bf9438905db1bbdf5d3ca2cae3b",
            serial = 20261116194835,
        },
        ["0.1.0-main+bab09313225a"] = {
            digests = {
                ["aarch64-linux"] = "357d5692269e036fd5bf7837723587045acb8e3b8452352e49769844051768c6",
                ["aarch64-macos"] = "357d5692269e036fd5bf7837723587045acb8e3b8452352e49769844051768c6",
                ["x86_64-linux"] = "357d5692269e036fd5bf7837723587045acb8e3b8452352e49769844051768c6",
            },
            commit = "bab09313225a48d5cda6d0aef7fd5d0ede4459b4",
            serial = 20261117160411,
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
