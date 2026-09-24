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
    },
    outputs = {
        bins = { "syft" },
        checks = {
            { "syft", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.52.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.52.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.52.0",
        },
    },
    versions = {
        ["1.51.1"] = {
            digests = {
                ["aarch64-linux"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
                ["aarch64-macos"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
                ["x86_64-linux"] = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
            },
            revision = 3,
        },
        ["1.52.0"] = {
            digests = {
                ["aarch64-linux"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
                ["aarch64-macos"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
                ["x86_64-linux"] = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
            },
            revision = 2,
        },
    },
}
