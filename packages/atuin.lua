return {
    name = "atuin",
    description = "Search and sync shell history",
    homepage = "https://atuin.sh/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "atuinsh/atuin",
        repository_id = 301244405,
        tag = "v{version}",
    },
    prebuilt = {
        github = "atuinsh/atuin",
        tag = "v{version}",
        asset = "atuin-{target}.tar.gz",
    },
    outputs = {
        bins = { "atuin" },
        checks = {
            { "atuin", "--version" },
            { "atuin", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "18.24.6",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.6",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.6",
        },
    },
    versions = {
        ["18.24.5"] = {
            digests = {
                ["aarch64-linux"] = "b44b3f264652b847b2e524ec397aa498c13076ed75cf213239ed2b9a0de2f99d",
                ["aarch64-macos"] = "644e92d5667e2ebbc00758c71d5974bc907d238eaa6cdc32b24eb73dce7f9a5a",
                ["x86_64-linux"] = "54182762c9d91a4f779748f622749ff6963956db005feb13e62d037196b05618",
            },
        },
        ["18.24.6"] = {
            digests = {
                ["aarch64-linux"] = "0dcc72a06738f913040cdd990298a37d9ef062c8849026d0a3410d2def4c6bf7",
                ["aarch64-macos"] = "756b7d2f8cb919d29888ea52b2fb19aba92ed52ddbca456839088ccc63257f5b",
                ["x86_64-linux"] = "49b6e7a93cd6d8c77ee02bdb0eef0acff4c80ddaa0efb00c8179285771043698",
            },
        },
    },
}
