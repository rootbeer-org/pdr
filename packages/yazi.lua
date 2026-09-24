return {
    name = "yazi",
    description = "Browse and manage files in the terminal",
    homepage = "https://yazi-rs.github.io",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "sxyazi/yazi",
        repository_id = 663900193,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sxyazi/yazi",
        tag = "v{version}",
        asset = "yazi-{target}.zip",
    },
    outputs = {
        bins = { "yazi", "ya" },
        checks = {
            { "yazi", "--version" },
            { "ya", "--version" },
            { "ya", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "26.9.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "26.9.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "26.9.1",
        },
    },
    versions = {
        ["26.9.1"] = {
            digests = {
                ["aarch64-linux"] = "dd569daecaae914185f295634109295ccd25c1b42b02eb89a74f651970024f2e",
                ["aarch64-macos"] = "3921182a21cceb0a505e5dac578e1487d48104caa5f114e9f8adf40b5a7289a9",
                ["x86_64-linux"] = "9b9c39decccf8cb0ff53a7d637d38f8a79d93bbd0099f4ea9c619ef6bb392f5d",
            },
            revision = 2,
        },
    },
}
