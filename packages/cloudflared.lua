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
            default_version = "2026.10.2",
        },
        ["aarch64-macos"] = {
            default_version = "2026.10.2",
        },
        ["x86_64-linux"] = {
            default_version = "2026.10.2",
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
        ["2026.9.3"] = {
            digests = {
                ["aarch64-linux"] = "f247f358f4dcc54d83a717be25b337f3e87ab4033e95e703b2d7e576bd534fef",
                ["aarch64-macos"] = "f247f358f4dcc54d83a717be25b337f3e87ab4033e95e703b2d7e576bd534fef",
                ["x86_64-linux"] = "f247f358f4dcc54d83a717be25b337f3e87ab4033e95e703b2d7e576bd534fef",
            },
            revision = 2,
        },
    },
}
