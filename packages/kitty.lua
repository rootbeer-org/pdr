return {
    name = "kitty",
    description = "Use a fast, feature-rich, GPU-based terminal emulator",
    homepage = "https://sw.kovidgoyal.net/kitty/",
    default_license = "GPL-3.0",
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.48.2",
            upstream = { github = "kovidgoyal/kitty", repository_id = 71056775, tag_prefix = "v" },
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}-{target}.txz",
            },
            outputs = {
                bins = { kitten = "bin/kitten", kitty = "bin/kitty" },
                checks = { { "kitty", "--version" }, { "kitten", "--version" } },
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.48.2",
            upstream = { github = "kovidgoyal/kitty", repository_id = 71056775, tag_prefix = "v" },
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}.dmg",
                mirror = true,
            },
            outputs = {
                bins = {
                    kitten = "kitty.app/Contents/MacOS/kitten",
                    kitty = "kitty.app/Contents/MacOS/kitty",
                },
                apps = { ["kitty.app"] = "kitty.app" },
                checks = { { "kitty", "--version" }, { "kitten", "--version" } },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.48.2",
            upstream = { github = "kovidgoyal/kitty", repository_id = 71056775, tag_prefix = "v" },
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}-{target}.txz",
            },
            outputs = {
                bins = { kitten = "bin/kitten", kitty = "bin/kitty" },
                checks = { { "kitty", "--version" }, { "kitten", "--version" } },
            },
        },
    },
    versions = {
        ["0.48.2"] = {
            digests = {
                ["aarch64-linux"] = "534b214d407a05e4603da75ef02fffa592ec1bbec20a413c5e0cd3f853c928cb",
                ["aarch64-macos"] = "f804f58ee4b69c76f84eb3281e140748269a63f3f4a816015a8dec2a06d2b195",
                ["x86_64-linux"] = "967a1958e7fc67b495d279c0963bcd1a0482097151817ce6506fabc822689af7",
            },
        },
    },
}
