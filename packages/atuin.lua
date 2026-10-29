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
            default_version = "18.24.3",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.3",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.3",
        },
    },
    versions = {
        ["18.24.2"] = {
            digests = {
                ["aarch64-linux"] = "9addf06ece26e68e842489cefa33e81860c288da373538986ea58c23eccb4f14",
                ["aarch64-macos"] = "ba155cb61385e424c972ba5cadab68add2c6ad0d4f842365fc958d7a5f5917d5",
                ["x86_64-linux"] = "311cd1ba4b8be27de7071dbcae1c95ff4c2b38aeec82d557707b6b832bfceddf",
            },
        },
        ["18.24.3"] = {
            digests = {
                ["aarch64-linux"] = "48d7bc0e6821bcaef7e9752abaa4ded541b36889b1620923d8abb17fa34059b3",
                ["aarch64-macos"] = "dd266366b1b00c298d689b0613c1acbe82855f04eb47d3f3f96262b148d8ebb9",
                ["x86_64-linux"] = "7e2ae5dbbced1c40ee9eb20815436253a7fac2363a77024021892880beb0b589",
            },
        },
    },
}
