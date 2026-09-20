return {
    schema = 2,
    name = "kitty",
    description = "Use a fast, feature-rich, GPU-based terminal emulator",
    homepage = "https://sw.kovidgoyal.net/kitty/",
    default_version = "0.48.2",
    upstream = {
        github = "kovidgoyal/kitty",
        repository_id = 71056775,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "kovidgoyal/kitty",
            tag = "v{version}",
            assets = {
                ["aarch64-linux"] = "kitty-{version}-arm64.txz",
                ["x86_64-linux"] = "kitty-{version}-x86_64.txz",
            },
        },
    },
    systems = { "aarch64-linux", "x86_64-linux" },
    outputs = {
        bins = { "kitty", "kitten" },
        bin_paths = {
            kitty = "bin/kitty",
            kitten = "bin/kitten",
        },
        checks = {
            { "kitty", "--version" },
            { "kitten", "--version" },
        },
    },
    versions = {
        ["0.48.2"] = {},
    },
}
