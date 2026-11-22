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
            default_version = "0.1.0-main+44c68404098b",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+44c68404098b",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+44c68404098b",
        },
    },
    versions = {
        ["0.1.0-main+44c68404098b"] = {
            digests = {
                ["aarch64-linux"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
                ["aarch64-macos"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
                ["x86_64-linux"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
            },
            commit = "44c68404098b3469e9551f730aeed23fcadafc71",
            serial = 20261122201048,
        },
        ["0.1.0-main+80ca5d6a08e6"] = {
            digests = {
                ["aarch64-linux"] = "9ccde5e94d7e8aedec6b4fa4290a7ed0e6c6cb2cd85dca8ad8c93017e7f8c8fa",
                ["aarch64-macos"] = "9ccde5e94d7e8aedec6b4fa4290a7ed0e6c6cb2cd85dca8ad8c93017e7f8c8fa",
                ["x86_64-linux"] = "9ccde5e94d7e8aedec6b4fa4290a7ed0e6c6cb2cd85dca8ad8c93017e7f8c8fa",
            },
            commit = "80ca5d6a08e6b57eb4942b4c1c9148742f91a9a7",
            serial = 20261122183408,
        },
        ["0.1.0-main+9fe7b31da2bb"] = {
            digests = {
                ["aarch64-linux"] = "deb2278dee79aefa8772ba7614d37fa3828ac89b864be71ab5a6d72a97f7c73a",
                ["aarch64-macos"] = "deb2278dee79aefa8772ba7614d37fa3828ac89b864be71ab5a6d72a97f7c73a",
                ["x86_64-linux"] = "deb2278dee79aefa8772ba7614d37fa3828ac89b864be71ab5a6d72a97f7c73a",
            },
            commit = "9fe7b31da2bbf54aa27839294d685493dc97dd24",
            serial = 20261122194520,
        },
    },
}
