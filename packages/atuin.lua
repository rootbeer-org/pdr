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
            default_version = "18.24.4",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "18.24.4",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "18.24.4",
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
        ["18.24.4"] = {
            digests = {
                ["aarch64-linux"] = "7698bd70195bde165bb37ea3133aa6663dd48ff7d6a23042cda2c7be4c22ba78",
                ["aarch64-macos"] = "edd06294377599bf4d85ca3337abc802256a991262260bdd980d1b649583553d",
                ["x86_64-linux"] = "788cff5b3903ca7f1f5bdff3e4b4975c38b3c20385176a49b01ad1bea5b37636",
            },
        },
    },
}
