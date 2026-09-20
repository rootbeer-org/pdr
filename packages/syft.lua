return {
    schema = 2,
    name = "syft",
    description = "Generate software bills of materials",
    homepage = "https://github.com/anchore/syft",
    default_version = "1.52.0",
    upstream = {
        github = "anchore/syft",
        repository_id = 262126497,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/anchore/syft/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "syft-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { syft = "./cmd/syft" },
            variables = { ["main.version"] = "{version}" },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "syft" },
        checks = {
            { "syft", "version" },
        },
    },
    versions = {
        ["1.51.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "da8d83cdca78f2c553e08a5ecb9734016a05adb904168531f582bebfbb9bb2cf",
                },
            },
        },
        ["1.52.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "8b999a1b8bd08b12512176cdec5d063db9cfe209c65cc5de9c4eb2ab7bdc7b3c",
                },
            },
        },
    },
}
