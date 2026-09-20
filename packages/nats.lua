return {
    schema = 2,
    name = "nats",
    description = "Manage and inspect NATS services",
    homepage = "https://github.com/nats-io/natscli",
    default_version = "0.5.0",
    upstream = {
        github = "nats-io/natscli",
        repository_id = 318166068,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/nats-io/natscli/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "natscli-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { nats = "./nats" },
            variables = { ["main.version"] = "{version}" },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "nats" },
        checks = {
            { "nats", "--version" },
            { "nats", "--help" },
        },
    },
    versions = {
        ["0.4.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "6dc9056aa439f90de2a705983005363ae05f1f9985b81881cbfffa867a344ef6",
                },
            },
        },
        ["0.5.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "832f2fcd53de5eceeb9d497ab603cbf32698646dfe156d23b70553e40eb1438b",
                },
            },
        },
    },
}
