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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
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
            default_version = "0.27.2",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "0.27.2",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "0.27.2",
        },
    },
    versions = {
        ["0.27.1"] = {
            digests = {
                ["aarch64-linux"] = "3c0d0113cae3fea36f2336c271cbdacbcdb349edb006319155652b9386803c55",
                ["aarch64-macos"] = "6362cda144b6e45d92c739d4eafb7e3c322f0545b0b959b4f7ca7d53fb3300fa",
                ["x86_64-linux"] = "c7e686aec16ba17053c2e6fd87600ccb10cf8ba3d055756b17e756d538e11114",
            },
        },
        ["0.27.2"] = {
            digests = {
                ["aarch64-linux"] = "4598875d129dfef384b3d78da329b766f151c2f827404fb5f3363a135935d0d3",
                ["aarch64-macos"] = "2f5645377a5f99ce0b019a316a9a2f17457a53d6f494eff437433db69b6fc363",
                ["x86_64-linux"] = "b4233ecc4f0e648d6d8ccc4bac96c00c712ca1a5eb1e0ca7197d29b750bffa6d",
            },
        },
    },
}
