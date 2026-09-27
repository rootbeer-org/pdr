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
            default_version = "0.71.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.71.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.71.0",
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
    },
}
