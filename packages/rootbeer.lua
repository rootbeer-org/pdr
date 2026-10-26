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
            default_version = "0.1.0-main+3c4c6c73af69",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+3c4c6c73af69",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+3c4c6c73af69",
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
        ["0.1.0-main+4cea6f999605"] = {
            digests = {
                ["aarch64-linux"] = "1d699a51a29c59f02631ebfc71da7f7ce6c728ed3d61af245d7fc3ecff700a6c",
                ["aarch64-macos"] = "1d699a51a29c59f02631ebfc71da7f7ce6c728ed3d61af245d7fc3ecff700a6c",
                ["x86_64-linux"] = "1d699a51a29c59f02631ebfc71da7f7ce6c728ed3d61af245d7fc3ecff700a6c",
            },
            commit = "4cea6f99960557c4b3b0cd20697c385faf02b9d2",
            serial = 20261021150837,
        },
        ["0.1.0-main+8f7aa4a54668"] = {
            digests = {
                ["aarch64-linux"] = "db8540fc12d520209875329a3818182753b0ef8c08f5dc57ab3df0c747d7091e",
                ["aarch64-macos"] = "db8540fc12d520209875329a3818182753b0ef8c08f5dc57ab3df0c747d7091e",
                ["x86_64-linux"] = "db8540fc12d520209875329a3818182753b0ef8c08f5dc57ab3df0c747d7091e",
            },
            commit = "8f7aa4a546680936784b61025fb68ed3ebb2c062",
            serial = 20261025020507,
        },
    },
}
