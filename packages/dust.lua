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
            default_version = "1.2.7",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.2.7",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.2.7",
        },
    },
    versions = {
        ["1.2.6"] = {
            digests = {
                ["aarch64-linux"] = "a51cf42a4654864837cc116eaca914271d7a09a9c2a60de90ecc2187b8d855a7",
                ["aarch64-macos"] = "5c37ee0d353165c73aedd6b21b9133182221efe08f9a5e76c082d9d6d5a0935d",
                ["x86_64-linux"] = "cbf2cb5c9d6227e46fc4b29c03dc43b8632020dfc5cf269d263d6e29c399e044",
            },
        },
        ["1.2.7"] = {
            digests = {
                ["aarch64-linux"] = "4c8ebaf224179bfd42db45d8a50fd5304bbd89532eda94db684d309c7b734ed6",
                ["aarch64-macos"] = "38e1b3b4e5e6a5cdb044b5fdb32ea45f18dc78276711796214806f20f7705a99",
                ["x86_64-linux"] = "2f1a1106f1f14c0b684b2f0a5f4482c6d53e07a871df4afc11e3b91ade300b55",
            },
        },
    },
}
