return {
    name = "tailscale",
    description = "Connect devices over a private WireGuard mesh network",
    homepage = "https://tailscale.com",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "tailscale/tailscale",
        repository_id = 237523442,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/tailscale/tailscale/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "tailscale-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                tailscale = "./cmd/tailscale",
                tailscaled = "./cmd/tailscaled",
            },
            variables = {
                ["tailscale.com/version.gitCommitStamp"] = "{commit}",
                ["tailscale.com/version.longStamp"] = "{version}",
                ["tailscale.com/version.shortStamp"] = "{version}",
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
        bins = { "tailscale", "tailscaled" },
        checks = {
            { "tailscale", "version" },
            { "tailscaled", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.104.5",
        },
        ["aarch64-macos"] = {
            default_version = "1.104.5",
        },
        ["x86_64-linux"] = {
            default_version = "1.104.5",
        },
    },
    versions = {
        ["1.104.4"] = {
            digests = {
                ["aarch64-linux"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
                ["aarch64-macos"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
                ["x86_64-linux"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
            },
            commit = "27047635f237d1f3e0b08c0f487674757f30d2f7",
        },
        ["1.104.5"] = {
            digests = {
                ["aarch64-linux"] = "0704fa4ce8624463ce421f45f0d20ae8d710b9ee7354eaa1f4a772e9a3cd4ded",
                ["aarch64-macos"] = "0704fa4ce8624463ce421f45f0d20ae8d710b9ee7354eaa1f4a772e9a3cd4ded",
                ["x86_64-linux"] = "0704fa4ce8624463ce421f45f0d20ae8d710b9ee7354eaa1f4a772e9a3cd4ded",
            },
            commit = "73a48057aaf5f60e4f770b398e9b7af576b01dbe",
        },
    },
}
