return {
    name = "ripgrep",
    aliases = { "rg" },
    description = "Search file contents with regular expressions",
    homepage = "https://github.com/BurntSushi/ripgrep",
    default_license = "Unlicense",
    prebuilt = {
        github = "BurntSushi/ripgrep",
        tag = "{version}",
        asset = "ripgrep-{tag}-{target}.tar.gz",
    },
    outputs = { bins = { "rg" }, checks = { { "rg", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "15.2.0",
            upstream = { github = "BurntSushi/ripgrep", repository_id = 53631945, tag_prefix = "" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "15.2.0",
            upstream = { github = "BurntSushi/ripgrep", repository_id = 53631945, tag_prefix = "" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "15.2.0",
            upstream = { github = "BurntSushi/ripgrep", repository_id = 53631945, tag_prefix = "" },
        },
    },
    versions = {
        ["15.2.0"] = {
            digests = {
                ["aarch64-linux"] = "800b1e7206afe799dfb5a6901f23147cfaabe0e52210538100f61e86e1740915",
                ["aarch64-macos"] = "3750b2e93f37e0c692657da574d7019a101c0084da05a790c83fd335bad973e4",
                ["x86_64-linux"] = "33e15bcf1624b25cdd2a55813a47a2f95dbe126268203e76aa6a585d1e7b149c",
            },
            revision = 3,
        },
    },
}
