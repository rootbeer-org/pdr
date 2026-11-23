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
            default_version = "2026.11.2",
        },
        ["aarch64-macos"] = {
            default_version = "2026.11.2",
        },
        ["x86_64-linux"] = {
            default_version = "2026.11.2",
        },
    },
    versions = {
        ["2026.11.1"] = {
            digests = {
                ["aarch64-linux"] = "d72ba7465d392a7c82be85e9417c0c923aa69e7c6dbc9baaeb42bb49a8f0572d",
                ["aarch64-macos"] = "d72ba7465d392a7c82be85e9417c0c923aa69e7c6dbc9baaeb42bb49a8f0572d",
                ["x86_64-linux"] = "d72ba7465d392a7c82be85e9417c0c923aa69e7c6dbc9baaeb42bb49a8f0572d",
            },
        },
        ["2026.11.2"] = {
            digests = {
                ["aarch64-linux"] = "e135894809a639d248f46636088ea8b659ed4d063be4873a541b2d9c2de36790",
                ["aarch64-macos"] = "e135894809a639d248f46636088ea8b659ed4d063be4873a541b2d9c2de36790",
                ["x86_64-linux"] = "e135894809a639d248f46636088ea8b659ed4d063be4873a541b2d9c2de36790",
            },
        },
    },
}
