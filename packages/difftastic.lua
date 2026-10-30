return {
    name = "difftastic",
    aliases = { "difft" },
    description = "Compare files structurally by syntax",
    homepage = "https://difftastic.wilfred.me.uk/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "Wilfred/difftastic",
        repository_id = 162276894,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/Wilfred/difftastic/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "difftastic-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "difftastic" },
        },
    },
    outputs = {
        bins = { "difft" },
        checks = {
            { "difft", "--version" },
            { "difft", "--list-languages" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.72.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.72.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.72.0",
        },
    },
    versions = {
        ["0.71.0"] = {
            digests = {
                ["aarch64-linux"] = "d6afd26103c6492a91307dc6779c7dd0ca4d4c85499f81d7dc53fdfa5107331d",
                ["aarch64-macos"] = "d6afd26103c6492a91307dc6779c7dd0ca4d4c85499f81d7dc53fdfa5107331d",
                ["x86_64-linux"] = "d6afd26103c6492a91307dc6779c7dd0ca4d4c85499f81d7dc53fdfa5107331d",
            },
        },
        ["0.72.0"] = {
            digests = {
                ["aarch64-linux"] = "ed8e2d59d44d62289b17c9d241e469bd72565fadf13c260676fc7a23bc28a844",
                ["aarch64-macos"] = "ed8e2d59d44d62289b17c9d241e469bd72565fadf13c260676fc7a23bc28a844",
                ["x86_64-linux"] = "ed8e2d59d44d62289b17c9d241e469bd72565fadf13c260676fc7a23bc28a844",
            },
        },
    },
}
