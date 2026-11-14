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
            default_version = "0.1.0-main+b37e21f4e901",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+b37e21f4e901",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+b37e21f4e901",
        },
    },
    versions = {
        ["0.1.0-main+13b293e3ec8b"] = {
            digests = {
                ["aarch64-linux"] = "3fa1d1b738bfc1c0f614cb45ff9e806228a0af8e3199d3bb2b9a40a94c87866e",
                ["aarch64-macos"] = "3fa1d1b738bfc1c0f614cb45ff9e806228a0af8e3199d3bb2b9a40a94c87866e",
                ["x86_64-linux"] = "3fa1d1b738bfc1c0f614cb45ff9e806228a0af8e3199d3bb2b9a40a94c87866e",
            },
            commit = "13b293e3ec8b6e7400a8ce36234040e72c0c53e8",
            serial = 20261114045356,
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
        ["0.1.0-main+b37e21f4e901"] = {
            digests = {
                ["aarch64-linux"] = "3ced0a3b081ad8cf9a5cdb1f948f21c8dd9f847beee022ed39a2cb76b3d42f08",
                ["aarch64-macos"] = "3ced0a3b081ad8cf9a5cdb1f948f21c8dd9f847beee022ed39a2cb76b3d42f08",
                ["x86_64-linux"] = "3ced0a3b081ad8cf9a5cdb1f948f21c8dd9f847beee022ed39a2cb76b3d42f08",
            },
            commit = "b37e21f4e901b616e88165d41737e1ab4d2a17e0",
            serial = 20261114212947,
        },
    },
}
