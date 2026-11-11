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
            default_version = "0.46.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.46.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.46.0",
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
        ["0.46.0"] = {
            digests = {
                ["aarch64-linux"] = "c416b3d29ec9c71baf8754fe66663afe4f615395895e3f9b8b6e3bd0f7042427",
                ["aarch64-macos"] = "716a1c7887be83cc813900012a156a4d8e0ee1468ac56c58a299c9d8898cdc90",
                ["x86_64-linux"] = "a8ee599eb357b6142443c91506a4ece3aa8811cb75dcf2b28d194bd66853c79d",
            },
        },
    },
}
