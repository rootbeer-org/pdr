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
            default_version = "1.104.7",
        },
        ["aarch64-macos"] = {
            default_version = "1.104.7",
        },
        ["x86_64-linux"] = {
            default_version = "1.104.7",
        },
    },
    versions = {
        ["1.104.6"] = {
            digests = {
                ["aarch64-linux"] = "a6ea0771776ab9d3b93147cc221ad02f1b75073ce34380bb29d58b7df9863f44",
                ["aarch64-macos"] = "a6ea0771776ab9d3b93147cc221ad02f1b75073ce34380bb29d58b7df9863f44",
                ["x86_64-linux"] = "a6ea0771776ab9d3b93147cc221ad02f1b75073ce34380bb29d58b7df9863f44",
            },
            commit = "c54807352ae196919497b3f8fddc3cedf88368b9",
        },
        ["1.104.7"] = {
            digests = {
                ["aarch64-linux"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
                ["aarch64-macos"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
                ["x86_64-linux"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
            },
            commit = "cbc74fe48ef1b1649f69a4d9a602319427e25102",
        },
    },
}
