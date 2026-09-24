return {
    name = "uv",
    description = "Manage Python projects, tools, and environments",
    homepage = "https://docs.astral.sh/uv/",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "astral-sh/uv",
        repository_id = 699532645,
        tag = "{version}",
    },
    prebuilt = {
        github = "astral-sh/uv",
        tag = "{version}",
        asset = "uv-{target}.tar.gz",
    },
    outputs = {
        bins = { "uv", "uvx" },
        checks = {
            { "uv", "--version" },
            { "uvx", "--version" },
            { "uv", "python", "list", "--only-installed", "--offline" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.12.17",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.12.17",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.12.17",
        },
    },
    versions = {
        ["0.12.13"] = {
            digests = {
                ["aarch64-linux"] = "f44bc1037a17889fe562fffd2002d4ed108e499fbe68b4f022af244dc7b8244f",
                ["aarch64-macos"] = "7e6ddb9316acc00f2296c82ff4d99977870ee34b2f0ddcae9444d714db9364ed",
                ["x86_64-linux"] = "4e2bfd0c9007b1032a50e539e965fd0a6037d87ad93ae1580d220a92d4c94098",
            },
            revision = 2,
        },
        ["0.12.16"] = {
            digests = {
                ["aarch64-linux"] = "5beba1f35c0922fd086cce850ce919e55bc4e873c4fcda891343526afdb4c5b3",
                ["aarch64-macos"] = "b6e03fae61704b1aa622f12b792a69483e837b83068e44f4fd34f8a07a8f74a3",
                ["x86_64-linux"] = "a01206ffbd60f3a7ee30949be1863527986f5307494a064042c69ce7e6d44799",
            },
        },
        ["0.12.17"] = {
            digests = {
                ["aarch64-linux"] = "a6096da273d548cb9f277d237a01ac7344a39ef0f455c0e148e4dc9737c1596b",
                ["aarch64-macos"] = "85f00cbdc6dd3e97eba4c31b4d014375a9fdfe8f570023b84e5102fc3456896b",
                ["x86_64-linux"] = "6401c4665d8fa2a9893e087c91f585430738e3170f5398a1141483efb4a93310",
            },
        },
    },
}
