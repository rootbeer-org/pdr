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
            default_version = "0.13.8",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.13.8",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.13.8",
        },
    },
    versions = {
        ["0.13.7"] = {
            digests = {
                ["aarch64-linux"] = "2d3ec076a0c4c0e8250bb6418c44080828b544f1a3be0b6e46adf9fb6923de45",
                ["aarch64-macos"] = "81b811b57e4624df7ed3aac148e0359100d9962f3d9dce00aec533dc2e086731",
                ["x86_64-linux"] = "287491da03f2a785c70fa75b13e1f849918c2f2b5415fe84876b8214eeb792f9",
            },
        },
        ["0.13.8"] = {
            digests = {
                ["aarch64-linux"] = "0c6f8593fcf1eadfc60e663b685c408267559d7c5d61c689bbb9f3a7e369ba32",
                ["aarch64-macos"] = "6b71028a6b904f2ae3340ef52e595512de807d06c0a20eaef2f692581b246558",
                ["x86_64-linux"] = "61fb26dabc4f0cf1d050fc6c67d40e43e4fae2994af21ebc1e050b233bf2b5ed",
            },
        },
    },
}
