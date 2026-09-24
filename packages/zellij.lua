return {
    name = "zellij",
    description = "Manage terminal workspaces and sessions",
    homepage = "https://zellij.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "zellij-org/zellij",
        repository_id = 292014229,
        tag = "v{version}",
    },
    prebuilt = {
        github = "zellij-org/zellij",
        tag = "v{version}",
        asset = "zellij-{target}.tar.gz",
    },
    outputs = {
        bins = { "zellij" },
        checks = {
            { "zellij", "--version" },
            { "zellij", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.45.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.45.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.45.1",
        },
    },
    versions = {
        ["0.45.1"] = {
            digests = {
                ["aarch64-linux"] = "05f0802afadd53f8db9514e7cae53c9ae8432fed1b35b8294aa816ee3044a16b",
                ["aarch64-macos"] = "c029ba4fe1927b79ad9f0cdd59155c4dff80777863c85857d4d09b88b56f9891",
                ["x86_64-linux"] = "40bcc2e03f5d5ae8e054e39f676081fe12ab70871506996ba595834c3718eefc",
            },
            revision = 2,
        },
    },
}
