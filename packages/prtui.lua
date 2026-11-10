return {
    name = "prtui",
    description = "Review GitHub pull requests in the terminal",
    homepage = "https://github.com/tale/prtui",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "tale/prtui",
        repository_id = 1333872697,
        tag = "v{version}",
    },
    prebuilt = {
        github = "tale/prtui",
        tag = "v{version}",
        asset = "prtui-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "prtui" },
        checks = {
            { "prtui", "--version" },
            { "prtui", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.5.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.5.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-gnu",
            default_version = "0.5.0",
        },
    },
    versions = {
        ["0.4.1"] = {
            digests = {
                ["aarch64-linux"] = "4cda3292d0d4c89760abf37e77c56f8d76dc19a53172ea3cec9be5358e6c29a0",
                ["aarch64-macos"] = "3f6181076dc464adfba89644349386fee15814995d1ff3d9b75aa54bee24950b",
                ["x86_64-linux"] = "ba4ef1b7fd38d31acd4208a4a37289f95a18a97d5358a8a6646b47cb2caaf872",
            },
        },
        ["0.5.0"] = {
            digests = {
                ["aarch64-linux"] = "7d109d372935ce393dd87e7bb20b2937632fc33fd4b016aa12c91d74eada417a",
                ["aarch64-macos"] = "00d00b0bb7a1ea8e1911204099d3247eb458303c6d2cf224735b8452304220c5",
                ["x86_64-linux"] = "f117d9e4eab8b0798b43c0a3e4eb846b46e46467abcad2f2326eea8a49675496",
            },
        },
    },
}
