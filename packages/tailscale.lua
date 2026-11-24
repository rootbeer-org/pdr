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
            default_version = "1.106.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.106.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.106.1",
        },
    },
    versions = {
        ["1.104.7"] = {
            digests = {
                ["aarch64-linux"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
                ["aarch64-macos"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
                ["x86_64-linux"] = "fa1c922b33d0f6db6b073800d7a62fa84081323d247b21547c63a98ed7ecac14",
            },
            commit = "cbc74fe48ef1b1649f69a4d9a602319427e25102",
        },
        ["1.106.1"] = {
            digests = {
                ["aarch64-linux"] = "923da6e093853b6313d74b729fdffd869407f5c04230f9c157689829e273add7",
                ["aarch64-macos"] = "923da6e093853b6313d74b729fdffd869407f5c04230f9c157689829e273add7",
                ["x86_64-linux"] = "923da6e093853b6313d74b729fdffd869407f5c04230f9c157689829e273add7",
            },
            commit = "ca97d565daae99bf53b1f45f28c36ee081a14f04",
        },
    },
}
