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
            default_version = "0.13.7",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.13.7",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.13.7",
        },
    },
    versions = {
        ["0.13.6"] = {
            digests = {
                ["aarch64-linux"] = "819692e404d23e5aae6bc44c0e260f1f5492fd1910ab4693b2c650f926dbe800",
                ["aarch64-macos"] = "60fbd5c8a1ed681845eea28d9d622fcde03c51e91a43465b64a1e17db1ed3472",
                ["x86_64-linux"] = "5d61f26b6c7213779eda90edc6971ea6b0b796bfb8d49a574c8ad69b59838548",
            },
        },
        ["0.13.7"] = {
            digests = {
                ["aarch64-linux"] = "2d3ec076a0c4c0e8250bb6418c44080828b544f1a3be0b6e46adf9fb6923de45",
                ["aarch64-macos"] = "81b811b57e4624df7ed3aac148e0359100d9962f3d9dce00aec533dc2e086731",
                ["x86_64-linux"] = "287491da03f2a785c70fa75b13e1f849918c2f2b5415fe84876b8214eeb792f9",
            },
        },
    },
}
