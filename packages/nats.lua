return {
    name = "nats",
    description = "Manage and inspect NATS services",
    homepage = "https://github.com/nats-io/natscli",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "nats-io/natscli",
        repository_id = 318166068,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/nats-io/natscli/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "natscli-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                nats = "./nats",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "nats" },
        checks = {
            { "nats", "--version" },
            { "nats", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.5.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.5.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.5.1",
        },
    },
    versions = {
        ["0.5.0"] = {
            digests = {
                ["aarch64-linux"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
                ["aarch64-macos"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
                ["x86_64-linux"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
            },
            revision = 3,
        },
        ["0.5.1"] = {
            digests = {
                ["aarch64-linux"] = "808a8905383949625e0a3f86821865eda29d381274021ff2d9ea7d7448c951fc",
                ["aarch64-macos"] = "808a8905383949625e0a3f86821865eda29d381274021ff2d9ea7d7448c951fc",
                ["x86_64-linux"] = "808a8905383949625e0a3f86821865eda29d381274021ff2d9ea7d7448c951fc",
            },
        },
    },
}
