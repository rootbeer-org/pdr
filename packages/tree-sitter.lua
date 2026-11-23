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
            trees = {
                ["aarch64-linux"] = "eb2ab77c1dc74e19899d22e381bd7c71466b1c0960744b442e1f24f4b1b3f386",
                ["aarch64-macos"] = "e44d376c6b3cc11d0806ddf72b5e0ad5a0a17d4f66e3d5abcdf13662d0338dcf",
                ["x86_64-linux"] = "b0e95b42cd8ed5e3d50b83069bdb491bb2d8a53957e6c656c9027b8c5f6746a4",
            },
        },
        ["0.27.2"] = {
            digests = {
                ["aarch64-linux"] = "4598875d129dfef384b3d78da329b766f151c2f827404fb5f3363a135935d0d3",
                ["aarch64-macos"] = "2f5645377a5f99ce0b019a316a9a2f17457a53d6f494eff437433db69b6fc363",
                ["x86_64-linux"] = "b4233ecc4f0e648d6d8ccc4bac96c00c712ca1a5eb1e0ca7197d29b750bffa6d",
            },
            trees = {
                ["aarch64-linux"] = "e75cb95773bdbf674992ac46e3ca2ad70653349ab364577e9842c24e3efb27da",
                ["aarch64-macos"] = "cc3089c70ec949c9ad9227c22244c3c137568ededbaa09fea4e0bac2558206a6",
                ["x86_64-linux"] = "9b699a6d1faaeb6f9113793ad6ae1b7f58c5d78826fe72ebf44472713916e2b4",
            },
        },
    },
}
