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
            default_version = "0.1.0-main+3ec15a88d1da",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+3ec15a88d1da",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+3ec15a88d1da",
        },
    },
    versions = {
        ["0.1.0-main+0251f4acd54b"] = {
            digests = {
                ["aarch64-linux"] = "814909491f812b0dfef62dec9f357a221e62a3890e08319f6bc4ad844dda25b6",
                ["aarch64-macos"] = "814909491f812b0dfef62dec9f357a221e62a3890e08319f6bc4ad844dda25b6",
                ["x86_64-linux"] = "814909491f812b0dfef62dec9f357a221e62a3890e08319f6bc4ad844dda25b6",
            },
            commit = "0251f4acd54b076b46c813532c63900467e4c10c",
            serial = 20261118212153,
        },
        ["0.1.0-main+3ec15a88d1da"] = {
            digests = {
                ["aarch64-linux"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
                ["aarch64-macos"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
                ["x86_64-linux"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
            },
            commit = "3ec15a88d1da242e9d85edabdcc71c02faef98e9",
            serial = 20261121064220,
        },
        ["0.1.0-main+d452eb6fe2c2"] = {
            digests = {
                ["aarch64-linux"] = "eec7d32fbf50093b99d1e1f1164257b14e5250bbf142601ef874ac3630b4841f",
                ["aarch64-macos"] = "eec7d32fbf50093b99d1e1f1164257b14e5250bbf142601ef874ac3630b4841f",
                ["x86_64-linux"] = "eec7d32fbf50093b99d1e1f1164257b14e5250bbf142601ef874ac3630b4841f",
            },
            commit = "d452eb6fe2c24e380f32469c99693b11de0448b5",
            serial = 20261121044028,
        },
    },
}
