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
            default_version = "0.1.0-main+a3b42ac6c083",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+a3b42ac6c083",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+a3b42ac6c083",
        },
    },
    versions = {
        ["0.1.0-main+3c4c6c73af69"] = {
            digests = {
                ["aarch64-linux"] = "2df55ca2270714ffeff4e71cf6c2c4e6c6b1e19ba67bb30f9b95d453c0be048f",
                ["aarch64-macos"] = "2df55ca2270714ffeff4e71cf6c2c4e6c6b1e19ba67bb30f9b95d453c0be048f",
                ["x86_64-linux"] = "2df55ca2270714ffeff4e71cf6c2c4e6c6b1e19ba67bb30f9b95d453c0be048f",
            },
            commit = "3c4c6c73af6980f47fe21be4028e0f04caf0a32d",
            serial = 20261026164914,
        },
        ["0.1.0-main+a3b42ac6c083"] = {
            digests = {
                ["aarch64-linux"] = "3c889ff3dbfd2643af14feae9eecb4ee19d6a23c482e7db06acb65def3e8c2ed",
                ["aarch64-macos"] = "3c889ff3dbfd2643af14feae9eecb4ee19d6a23c482e7db06acb65def3e8c2ed",
                ["x86_64-linux"] = "3c889ff3dbfd2643af14feae9eecb4ee19d6a23c482e7db06acb65def3e8c2ed",
            },
            commit = "a3b42ac6c083b9b809035351a356b960cc318c5e",
            serial = 20261030163839,
        },
        ["0.1.0-main+d8f6edd4abd1"] = {
            digests = {
                ["aarch64-linux"] = "221e1be1c1fbfc9c495dcc50bd065cbc838869e100b06d84a4d5dacd6ff5590e",
                ["aarch64-macos"] = "221e1be1c1fbfc9c495dcc50bd065cbc838869e100b06d84a4d5dacd6ff5590e",
                ["x86_64-linux"] = "221e1be1c1fbfc9c495dcc50bd065cbc838869e100b06d84a4d5dacd6ff5590e",
            },
            commit = "d8f6edd4abd11272b14ef8ad0480f15b4271b87f",
            serial = 20261029222135,
        },
    },
}
