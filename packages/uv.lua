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
            default_version = "0.13.6",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.13.6",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.13.6",
        },
    },
    versions = {
        ["0.13.5"] = {
            digests = {
                ["aarch64-linux"] = "7906c79adb21c81abd559841ba76bb1d9af9d791acac7a041b2972e03ae16538",
                ["aarch64-macos"] = "743f85035a1996ecb350659e01cd9faea9709829be09b1b4b03c73eaf3c9cd73",
                ["x86_64-linux"] = "57ef9d9ccb01fb1bd998df995b0dd221b52f7d7841fbea93f2d4463bf61fb7a9",
            },
        },
        ["0.13.6"] = {
            digests = {
                ["aarch64-linux"] = "819692e404d23e5aae6bc44c0e260f1f5492fd1910ab4693b2c650f926dbe800",
                ["aarch64-macos"] = "60fbd5c8a1ed681845eea28d9d622fcde03c51e91a43465b64a1e17db1ed3472",
                ["x86_64-linux"] = "5d61f26b6c7213779eda90edc6971ea6b0b796bfb8d49a574c8ad69b59838548",
            },
        },
    },
}
