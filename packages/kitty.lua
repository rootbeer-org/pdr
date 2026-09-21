return {
    schema = 2,
    name = "kitty",
    description = "Use a fast, feature-rich, GPU-based terminal emulator",
    homepage = "https://sw.kovidgoyal.net/kitty/",
    default_version = "0.48.2",
    default_versions = { ["aarch64-macos"] = "0.48.2" },
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
        ["0.48.2"] = {
            platforms = {
                ["aarch64-macos"] = {
                    inputs = {
                        prebuilt = {
                            github = "kovidgoyal/kitty",
                            tag = "v{version}",
                            assets = {
                                ["aarch64-macos"] = "kitty-{version}.dmg",
                            },
                            checksums = {
                                ["aarch64-macos"] = "f804f58ee4b69c76f84eb3281e140748269a63f3f4a816015a8dec2a06d2b195",
                            },
                            mirror = true,
                        },
                    },
                    outputs = {
                        bins = { "kitty", "kitten" },
                        bin_paths = {
                            kitty = "kitty.app/Contents/MacOS/kitty",
                            kitten = "kitty.app/Contents/MacOS/kitten",
                        },
                        apps = {
                            ["kitty.app"] = "kitty.app",
                        },
                        checks = { { "kitty", "--version" }, { "kitten", "--version" } },
                    },
                },
            },
        },
    },
}
