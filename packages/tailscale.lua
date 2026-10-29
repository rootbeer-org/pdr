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
            default_version = "1.104.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.104.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.104.4",
        },
    },
    versions = {
        ["1.104.2"] = {
            digests = {
                ["aarch64-linux"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
                ["aarch64-macos"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
                ["x86_64-linux"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
            },
            commit = "e26db7a5797683ec99ad1516c40b628c7f2dfd71",
        },
        ["1.104.4"] = {
            digests = {
                ["aarch64-linux"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
                ["aarch64-macos"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
                ["x86_64-linux"] = "862f12b3177d5e961f2a86cf82fb1ff3551786afcaf95f2dc9a8318889f98732",
            },
            commit = "27047635f237d1f3e0b08c0f487674757f30d2f7",
        },
    },
}
