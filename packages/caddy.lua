return {
    schema = 2,
    name = "caddy",
    description = "Serve HTTP with automatic HTTPS",
    default_version = "2.11.4",
    homepage = "https://github.com/caddyserver/caddy",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "caddyserver/caddy",
        repository_id = 29207621,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/caddyserver/caddy/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "caddy-{version}",
        },
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
    versions = {
        ["2.11.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2c3d02078286a6282cdb4d1d8744077788d556659dac0b64d8ed5886a7e5aeb9",
                },
            },
        },
    },
}
