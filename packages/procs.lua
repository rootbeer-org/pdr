return {
    name = "procs",
    description = "View and search running processes",
    homepage = "https://github.com/dalance/procs",
    default_license = "MIT",
    prebuilt = { github = "dalance/procs", tag = "v{version}", asset = "procs-{tag}-{target}.zip" },
    outputs = { bins = { "procs" }, checks = { { "procs", "--version" }, { "procs", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-linux",
            default_version = "0.14.12",
            upstream = { github = "dalance/procs", repository_id = 167957539, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-mac",
            default_version = "0.14.12",
            upstream = { github = "dalance/procs", repository_id = 167957539, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-linux",
            default_version = "0.14.12",
            upstream = { github = "dalance/procs", repository_id = 167957539, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.14.12"] = {
            digests = {
                ["aarch64-linux"] = "74b4f82acc6fe553cbd5af20ba0baac420b42bef9bb0cbb38fef14b8317d9f91",
                ["aarch64-macos"] = "20c7a33426ed7a43c3e13a48f2d1866ecc979a8ad46733f86ddc78ab7f12d49c",
                ["x86_64-linux"] = "81964faf9d5cd0e9f399d5d0954fb6fe4d4d9f7d3cbec4507633df5a45b11713",
            },
            revision = 2,
        },
    },
}
