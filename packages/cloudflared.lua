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
            default_version = "2026.10.3",
        },
        ["aarch64-macos"] = {
            default_version = "2026.10.3",
        },
        ["x86_64-linux"] = {
            default_version = "2026.10.3",
        },
    },
    versions = {
        ["2026.10.2"] = {
            digests = {
                ["aarch64-linux"] = "8dde1e9e4b0ad5ae09abd7b5790dabc9195ba48a5c7f0af7e54e787eef54a3cb",
                ["aarch64-macos"] = "8dde1e9e4b0ad5ae09abd7b5790dabc9195ba48a5c7f0af7e54e787eef54a3cb",
                ["x86_64-linux"] = "8dde1e9e4b0ad5ae09abd7b5790dabc9195ba48a5c7f0af7e54e787eef54a3cb",
            },
        },
        ["2026.10.3"] = {
            digests = {
                ["aarch64-linux"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
                ["aarch64-macos"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
                ["x86_64-linux"] = "68d298c522aef45fe8412e0ccf8f21ff12a6ad768aa69cbc23e10eac688ac8c8",
            },
        },
    },
}
