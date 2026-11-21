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
            default_version = "0.1.0-main+4f5ed5dfeced",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+4f5ed5dfeced",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+4f5ed5dfeced",
        },
    },
    versions = {
        ["0.1.0-main+3ec15a88d1da"] = {
            digests = {
                ["aarch64-linux"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
                ["aarch64-macos"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
                ["x86_64-linux"] = "aae928b7f7766860d3e612c0d4682fbf6e362b8aabf18d0d4e2ff2aec2fb2f5f",
            },
            commit = "3ec15a88d1da242e9d85edabdcc71c02faef98e9",
            serial = 20261121064220,
        },
        ["0.1.0-main+4f5ed5dfeced"] = {
            digests = {
                ["aarch64-linux"] = "44e1f5f553b66d529035eaa26dc7b2f74bc3be27aed5525609268378fa4849c9",
                ["aarch64-macos"] = "44e1f5f553b66d529035eaa26dc7b2f74bc3be27aed5525609268378fa4849c9",
                ["x86_64-linux"] = "44e1f5f553b66d529035eaa26dc7b2f74bc3be27aed5525609268378fa4849c9",
            },
            commit = "4f5ed5dfeced2e11e8158ac47a283e6e9e3623bb",
            serial = 20261121203622,
        },
        ["0.1.0-main+a09dbfd20a87"] = {
            digests = {
                ["aarch64-linux"] = "21e5aa734855ef9b080dd4c99def2dfbdcff848f774972b8221a46882fdf66bf",
                ["aarch64-macos"] = "21e5aa734855ef9b080dd4c99def2dfbdcff848f774972b8221a46882fdf66bf",
                ["x86_64-linux"] = "21e5aa734855ef9b080dd4c99def2dfbdcff848f774972b8221a46882fdf66bf",
            },
            commit = "a09dbfd20a87564b0e7b3843fc49eb4b551df93d",
            serial = 20261121190059,
        },
    },
}
