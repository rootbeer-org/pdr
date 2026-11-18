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
            default_version = "0.1.0-main+0251f4acd54b",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+0251f4acd54b",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0-main+0251f4acd54b",
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
        ["0.1.0-main+1a812b25b1b1"] = {
            digests = {
                ["aarch64-linux"] = "a4db7c508270d4033ff615f6855fa1d0c6ba5de5fb8760b1e3ec4ce42e2da878",
                ["aarch64-macos"] = "a4db7c508270d4033ff615f6855fa1d0c6ba5de5fb8760b1e3ec4ce42e2da878",
                ["x86_64-linux"] = "a4db7c508270d4033ff615f6855fa1d0c6ba5de5fb8760b1e3ec4ce42e2da878",
            },
            commit = "1a812b25b1b10447fe5b7415525b6de885bcab34",
            serial = 20261117165720,
        },
        ["0.1.0-main+cdba5b1ada85"] = {
            digests = {
                ["aarch64-linux"] = "c872bb108bb6c02f7393f8c40a94cb7a3d66f278390e297289a58dd6a02fba37",
                ["aarch64-macos"] = "c872bb108bb6c02f7393f8c40a94cb7a3d66f278390e297289a58dd6a02fba37",
                ["x86_64-linux"] = "c872bb108bb6c02f7393f8c40a94cb7a3d66f278390e297289a58dd6a02fba37",
            },
            commit = "cdba5b1ada8573468570e6346621fcd4c1b15575",
            serial = 20261118193801,
        },
    },
}
