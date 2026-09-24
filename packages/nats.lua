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
            default_version = "0.5.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.5.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.5.0",
        },
    },
    versions = {
        ["0.4.0"] = {
            digests = {
                ["aarch64-linux"] = "6dc9056aa439f90de2a705983005363ae05f1f9985b81881cbfffa867a344ef6",
                ["aarch64-macos"] = "6dc9056aa439f90de2a705983005363ae05f1f9985b81881cbfffa867a344ef6",
                ["x86_64-linux"] = "6dc9056aa439f90de2a705983005363ae05f1f9985b81881cbfffa867a344ef6",
            },
            revision = 3,
        },
        ["0.5.0"] = {
            digests = {
                ["aarch64-linux"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
                ["aarch64-macos"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
                ["x86_64-linux"] = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
            },
            revision = 2,
        },
    },
}
