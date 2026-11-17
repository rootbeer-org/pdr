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
            default_version = "0.13.9",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.13.9",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.13.9",
        },
    },
    versions = {
        ["0.13.8"] = {
            digests = {
                ["aarch64-linux"] = "0c6f8593fcf1eadfc60e663b685c408267559d7c5d61c689bbb9f3a7e369ba32",
                ["aarch64-macos"] = "6b71028a6b904f2ae3340ef52e595512de807d06c0a20eaef2f692581b246558",
                ["x86_64-linux"] = "61fb26dabc4f0cf1d050fc6c67d40e43e4fae2994af21ebc1e050b233bf2b5ed",
            },
        },
        ["0.13.9"] = {
            digests = {
                ["aarch64-linux"] = "37fbb7c5bc66cf99c12aa881949d216181e201dec449772c4329e56487d61179",
                ["aarch64-macos"] = "5aeca67f2283f75235de40d0bd9c0a5bbc5fce23b6d48b3bf9fa1b2db08382ca",
                ["x86_64-linux"] = "58ccf5f1792b8a5a88d01bc910ea131a8b3db4a319a17ad5fad75e0845a3e271",
            },
        },
    },
}
