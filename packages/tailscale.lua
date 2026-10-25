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
            default_version = "1.104.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.104.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.104.2",
        },
    },
    versions = {
        ["1.104.0"] = {
            digests = {
                ["aarch64-linux"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
                ["aarch64-macos"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
                ["x86_64-linux"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
            },
            commit = "c8125a977e8714ac9f0d1a1fb43c714490d38bd3",
        },
        ["1.104.2"] = {
            digests = {
                ["aarch64-linux"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
                ["aarch64-macos"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
                ["x86_64-linux"] = "4c1c806e16507414a1459afcdc399f6a1323c21a1ac90f07bea0465fd8fd7e1d",
            },
            commit = "e26db7a5797683ec99ad1516c40b628c7f2dfd71",
        },
    },
}
