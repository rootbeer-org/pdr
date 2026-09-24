return {
    name = "dust",
    aliases = { "du-dust" },
    description = "Inspect directory disk usage",
    homepage = "https://github.com/bootandy/dust",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "bootandy/dust",
        repository_id = 125563061,
        tag = "v{version}",
        exclude_tags = { "v0.8.1-alpha.2", "v0.8.1-alpha.1", "untagged-1499119fdec1dec70238" },
    },
    prebuilt = {
        github = "bootandy/dust",
        tag = "v{version}",
        asset = "dust-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "dust" },
        checks = {
            { "dust", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.2.6",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.2.6",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.2.6",
        },
    },
    versions = {
        ["1.2.5"] = {
            digests = {
                ["aarch64-linux"] = "331b328233a70e56f0509ff962b2a6ea606eb2e654ce8a0e9a3bebe1bd54a2be",
                ["aarch64-macos"] = "7f17449fecff70cce61e6060fac490dfe66b1b40ee1639bc1f72d121b846e364",
                ["x86_64-linux"] = "79813b5743fab1e04c1d9c34042aab865dbe09efb76719e7c7d260568850fabc",
            },
            revision = 2,
        },
        ["1.2.6"] = {
            digests = {
                ["aarch64-linux"] = "a51cf42a4654864837cc116eaca914271d7a09a9c2a60de90ecc2187b8d855a7",
                ["aarch64-macos"] = "5c37ee0d353165c73aedd6b21b9133182221efe08f9a5e76c082d9d6d5a0935d",
                ["x86_64-linux"] = "cbf2cb5c9d6227e46fc4b29c03dc43b8632020dfc5cf269d263d6e29c399e044",
            },
        },
    },
}
