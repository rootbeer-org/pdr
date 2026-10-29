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
            default_version = "2026.10.6",
        },
        ["aarch64-macos"] = {
            default_version = "2026.10.6",
        },
        ["x86_64-linux"] = {
            default_version = "2026.10.6",
        },
    },
    versions = {
        ["2026.10.3"] = {
            digests = {
                ["aarch64-linux"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
                ["aarch64-macos"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
                ["x86_64-linux"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
            },
        },
        ["2026.10.6"] = {
            digests = {
                ["aarch64-linux"] = "eb4d6b02b017cd3e49676934f14fe3025cebb07f9f272cd60dd790a2d812b90b",
                ["aarch64-macos"] = "eb4d6b02b017cd3e49676934f14fe3025cebb07f9f272cd60dd790a2d812b90b",
                ["x86_64-linux"] = "eb4d6b02b017cd3e49676934f14fe3025cebb07f9f272cd60dd790a2d812b90b",
            },
        },
    },
}
