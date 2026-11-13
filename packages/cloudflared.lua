return {
    name = "cloudflared",
    description = "Connect services through Cloudflare Tunnel",
    homepage = "https://github.com/cloudflare/cloudflared",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "cloudflare/cloudflared",
        repository_id = 106867604,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/cloudflare/cloudflared/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cloudflared-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                cloudflared = "./cmd/cloudflared",
            },
            variables = {
                ["github.com/cloudflare/cloudflared/cmd/cloudflared/updater.BuiltForPackageManager"] = "rootbeer",
                ["main.Version"] = "{version}",
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
        bins = { "cloudflared" },
        checks = {
            { "cloudflared", "--version" },
            { "cloudflared", "tunnel", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2026.11.0",
        },
        ["aarch64-macos"] = {
            default_version = "2026.11.0",
        },
        ["x86_64-linux"] = {
            default_version = "2026.11.0",
        },
    },
    versions = {
        ["2026.10.7"] = {
            digests = {
                ["aarch64-linux"] = "d268031cb8906675b6b6353f18a007e6fc028f170094c5ac9220493bc8147016",
                ["aarch64-macos"] = "d268031cb8906675b6b6353f18a007e6fc028f170094c5ac9220493bc8147016",
                ["x86_64-linux"] = "d268031cb8906675b6b6353f18a007e6fc028f170094c5ac9220493bc8147016",
            },
        },
        ["2026.11.0"] = {
            digests = {
                ["aarch64-linux"] = "9913452304215e1e7b0ecd75b3e1ca400d5c8b64156e176c5e0aaaca4238c539",
                ["aarch64-macos"] = "9913452304215e1e7b0ecd75b3e1ca400d5c8b64156e176c5e0aaaca4238c539",
                ["x86_64-linux"] = "9913452304215e1e7b0ecd75b3e1ca400d5c8b64156e176c5e0aaaca4238c539",
            },
        },
    },
}
