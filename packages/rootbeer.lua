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
            default_version = "0.1.0-main+231c1e413249",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+231c1e413249",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+231c1e413249",
        },
    },
    versions = {
        ["0.1.0-main+231c1e413249"] = {
            digests = {
                ["aarch64-linux"] = "a0c9f925c39f945fa79136d58562f3c29929d85dbca3c068c24c23a329d03f62",
                ["aarch64-macos"] = "a0c9f925c39f945fa79136d58562f3c29929d85dbca3c068c24c23a329d03f62",
                ["x86_64-linux"] = "a0c9f925c39f945fa79136d58562f3c29929d85dbca3c068c24c23a329d03f62",
            },
            commit = "231c1e41324981c1ef69ed393c326dd99d5c81ae",
            serial = 20261123045235,
        },
        ["0.1.0-main+44c68404098b"] = {
            digests = {
                ["aarch64-linux"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
                ["aarch64-macos"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
                ["x86_64-linux"] = "9f63004cd739b34677865defc977191fb7ea12f6c6c04458119507a914f702fa",
            },
            commit = "44c68404098b3469e9551f730aeed23fcadafc71",
            serial = 20261122201048,
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
