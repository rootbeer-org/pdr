return {
    name = "caddy",
    description = "Serve HTTP with automatic HTTPS",
    homepage = "https://github.com/caddyserver/caddy",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/caddyserver/caddy/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "caddy-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { caddy = "./cmd/caddy" },
            tags = { "nobadger", "nomysql", "nopgx" },
            variables = { ["github.com/caddyserver/caddy/v2.CustomVersion"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "caddy" },
        checks = { { "caddy", "version" }, { "caddy", "list-modules" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.11.4",
            upstream = { github = "caddyserver/caddy", repository_id = 29207621, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "2.11.4",
            upstream = { github = "caddyserver/caddy", repository_id = 29207621, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "2.11.4",
            upstream = { github = "caddyserver/caddy", repository_id = 29207621, tag_prefix = "v" },
        },
    },
    versions = {
        ["2.11.4"] = {
            digests = {
                ["aarch64-linux"] = "2c3d02078286a6282cdb4d1d8744077788d556659dac0b64d8ed5886a7e5aeb9",
                ["aarch64-macos"] = "2c3d02078286a6282cdb4d1d8744077788d556659dac0b64d8ed5886a7e5aeb9",
                ["x86_64-linux"] = "2c3d02078286a6282cdb4d1d8744077788d556659dac0b64d8ed5886a7e5aeb9",
            },
            revision = 3,
        },
    },
}
