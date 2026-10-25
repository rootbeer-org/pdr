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
            default_version = "0.1.0-main+8f7aa4a54668",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+8f7aa4a54668",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+8f7aa4a54668",
        },
    },
    versions = {
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
        ["0.1.0-main+962f344e5612"] = {
            digests = {
                ["aarch64-linux"] = "e774dbfc6dcf39ca96aa56237ae12ee9b6211fa5e13ba9e89cc78a235f933124",
                ["aarch64-macos"] = "e774dbfc6dcf39ca96aa56237ae12ee9b6211fa5e13ba9e89cc78a235f933124",
                ["x86_64-linux"] = "e774dbfc6dcf39ca96aa56237ae12ee9b6211fa5e13ba9e89cc78a235f933124",
            },
            commit = "962f344e5612786141466fffc9360ef280920423",
            serial = 20261020184635,
        },
    },
}
