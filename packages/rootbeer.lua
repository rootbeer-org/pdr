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
            default_version = "0.1.0-main+80ca5d6a08e6",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+80ca5d6a08e6",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+80ca5d6a08e6",
        },
    },
    versions = {
        ["0.1.0-main+33eec5c81804"] = {
            digests = {
                ["aarch64-linux"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
                ["aarch64-macos"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
                ["x86_64-linux"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
            },
            commit = "33eec5c81804191937b293763142150ee9290459",
            serial = 20261122004043,
        },
        ["0.1.0-main+77b11390d955"] = {
            digests = {
                ["aarch64-linux"] = "70e3b75180b17b64f60f034f495257ea77ce8d13d0e2901d75693c1fb86e1f58",
                ["aarch64-macos"] = "70e3b75180b17b64f60f034f495257ea77ce8d13d0e2901d75693c1fb86e1f58",
                ["x86_64-linux"] = "70e3b75180b17b64f60f034f495257ea77ce8d13d0e2901d75693c1fb86e1f58",
            },
            commit = "77b11390d95565590b35c2a869ed9db5d613bce2",
            serial = 20261122070346,
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
    },
}
