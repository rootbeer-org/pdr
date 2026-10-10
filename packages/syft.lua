return {
    name = "syft",
    description = "Generate software bills of materials",
    homepage = "https://github.com/anchore/syft",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "anchore/syft",
        repository_id = 262126497,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/anchore/syft/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "syft-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                syft = "./cmd/syft",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "syft" },
        checks = {
            { "syft", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.54.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.54.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.54.1",
        },
    },
    versions = {
        ["1.51.1"] = {
            digests = {
                ["aarch64-linux"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
                ["aarch64-macos"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
                ["x86_64-linux"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
            },
            revision = 4,
        },
        ["1.52.0"] = {
            digests = {
                ["aarch64-linux"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
                ["aarch64-macos"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
                ["x86_64-linux"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
            },
            revision = 3,
        },
        ["1.54.0"] = {
            digests = {
                ["aarch64-linux"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
                ["aarch64-macos"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
                ["x86_64-linux"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
            },
        },
        ["1.54.1"] = {
            digests = {
                ["aarch64-linux"] = "e3a8b41ef4050665edb7cb35bea1ffe49ab7bbdd3127e756ea7cf979d41e9dd5",
                ["aarch64-macos"] = "e3a8b41ef4050665edb7cb35bea1ffe49ab7bbdd3127e756ea7cf979d41e9dd5",
                ["x86_64-linux"] = "e3a8b41ef4050665edb7cb35bea1ffe49ab7bbdd3127e756ea7cf979d41e9dd5",
            },
        },
    },
}
