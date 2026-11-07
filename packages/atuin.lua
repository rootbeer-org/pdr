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
            default_version = "18.24.5",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.5",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.5",
        },
    },
    versions = {
        ["18.24.3"] = {
            digests = {
                ["aarch64-linux"] = "48d7bc0e6821bcaef7e9752abaa4ded541b36889b1620923d8abb17fa34059b3",
                ["aarch64-macos"] = "dd266366b1b00c298d689b0613c1acbe82855f04eb47d3f3f96262b148d8ebb9",
                ["x86_64-linux"] = "7e2ae5dbbced1c40ee9eb20815436253a7fac2363a77024021892880beb0b589",
            },
        },
        ["18.24.5"] = {
            digests = {
                ["aarch64-linux"] = "b44b3f264652b847b2e524ec397aa498c13076ed75cf213239ed2b9a0de2f99d",
                ["aarch64-macos"] = "644e92d5667e2ebbc00758c71d5974bc907d238eaa6cdc32b24eb73dce7f9a5a",
                ["x86_64-linux"] = "54182762c9d91a4f779748f622749ff6963956db005feb13e62d037196b05618",
            },
        },
    },
}
