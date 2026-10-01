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
                version = "1.27.1",
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
            default_version = "1.104.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.104.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.104.0",
        },
    },
    versions = {
        ["1.102.5"] = {
            digests = {
                ["aarch64-linux"] = "110b0d0586e981fccb83149d0ac4e7aac3c879fd372772b0dee1818f204893bc",
                ["aarch64-macos"] = "110b0d0586e981fccb83149d0ac4e7aac3c879fd372772b0dee1818f204893bc",
                ["x86_64-linux"] = "110b0d0586e981fccb83149d0ac4e7aac3c879fd372772b0dee1818f204893bc",
            },
            commit = "5fb2a81b065b0a0bbbfc67ab20a0d9c6a1108115",
            revision = 2,
        },
        ["1.104.0"] = {
            digests = {
                ["aarch64-linux"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
                ["aarch64-macos"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
                ["x86_64-linux"] = "d5ef52c6561de4a9ab671964976e205859250627817f65a9c1f9245b409efa95",
            },
            commit = "c8125a977e8714ac9f0d1a1fb43c714490d38bd3",
        },
    },
}
