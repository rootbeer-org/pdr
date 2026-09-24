return {
    name = "tree-sitter",
    aliases = { "tree-sitter-cli" },
    description = "Generate parsers and inspect syntax trees",
    homepage = "https://tree-sitter.github.io/tree-sitter/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "tree-sitter/tree-sitter",
        repository_id = 14164618,
        tag = "v{version}",
    },
    prebuilt = {
        github = "tree-sitter/tree-sitter",
        tag = "v{version}",
        asset = "tree-sitter-cli-{target}.zip",
    },
    outputs = {
        bins = { "tree-sitter" },
        checks = {
            { "tree-sitter", "--version" },
            { "tree-sitter", "query", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "0.27.0",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "0.27.0",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "0.27.0",
        },
    },
    versions = {
        ["0.27.0"] = {
            digests = {
                ["aarch64-linux"] = "6260b621bf5ab87027dfb463bf955504ef32cdcda62b81f28447753e48c83a62",
                ["aarch64-macos"] = "f278063d8544160f6f89f7f8dba6ba112cb0dd1669757788d2bb7a8a613d2c58",
                ["x86_64-linux"] = "e4a3826bcd0fe099ee3a5617767374939cbc23c4a35b5b53f5fc04142525a2c1",
            },
            revision = 2,
        },
    },
}
