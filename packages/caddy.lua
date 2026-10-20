return {
    name = "caddy",
    description = "Serve HTTP with automatic HTTPS",
    homepage = "https://caddyserver.com/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "caddyserver/caddy",
        repository_id = 29207621,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/caddyserver/caddy/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "caddy-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                caddy = "./cmd/caddy",
            },
            tags = { "nobadger", "nomysql", "nopgx" },
            variables = {
                ["github.com/caddyserver/caddy/v2.CustomVersion"] = "v{version}",
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
        bins = { "caddy" },
        checks = {
            { "caddy", "version" },
            { "caddy", "list-modules" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.11.7",
        },
        ["aarch64-macos"] = {
            default_version = "2.11.7",
        },
        ["x86_64-linux"] = {
            default_version = "2.11.7",
        },
    },
    versions = {
        ["2.11.6"] = {
            digests = {
                ["aarch64-linux"] = "cb65c6d2081e2700f44e03d808a0330344b483688934c87e53ba7b5728a3a04b",
                ["aarch64-macos"] = "cb65c6d2081e2700f44e03d808a0330344b483688934c87e53ba7b5728a3a04b",
                ["x86_64-linux"] = "cb65c6d2081e2700f44e03d808a0330344b483688934c87e53ba7b5728a3a04b",
            },
        },
        ["2.11.7"] = {
            digests = {
                ["aarch64-linux"] = "86e39de5fa0bc433a9cd574a00e7751059903401f3389c61f8937fd0ad0180f5",
                ["aarch64-macos"] = "86e39de5fa0bc433a9cd574a00e7751059903401f3389c61f8937fd0ad0180f5",
                ["x86_64-linux"] = "86e39de5fa0bc433a9cd574a00e7751059903401f3389c61f8937fd0ad0180f5",
            },
        },
    },
}
