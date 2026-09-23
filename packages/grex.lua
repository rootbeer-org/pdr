return {
    name = "grex",
    description = "Generate regular expressions from examples",
    homepage = "https://github.com/pemistahl/grex",
    default_license = "Apache-2.0",
    upstream = {
        github = "pemistahl/grex",
        repository_id = 213043312,
        tag = "v{version}",
    },
    prebuilt = {
        github = "pemistahl/grex",
        tag = "v{version}",
        asset = "grex-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "grex" },
        checks = {
            { "grex", "--version" },
            { "grex", "abc", "abd" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.4.6",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.4.6",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.4.6",
        },
    },
    versions = {
        ["1.4.6"] = {
            digests = {
                ["aarch64-linux"] = "65ac2010ffc4a02690b091819f2971c0b26081b2ce7cb717a0de3f10409010b9",
                ["aarch64-macos"] = "5a249c9c7866835f8b0be95475fc49189da412c09f95266ffa8401b85c094078",
                ["x86_64-linux"] = "8f02f4ebe72d9e3098c646b77f7bc53ec8a8c1fb51ed042db06b739d08e56af8",
            },
            revision = 2,
        },
    },
}
