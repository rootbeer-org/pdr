return {
    name = "kitty",
    description = "Use a fast, feature-rich, GPU-based terminal emulator",
    homepage = "https://sw.kovidgoyal.net/kitty/",
    default_license = "GPL-3.0",
    upstream = {
        github = "kovidgoyal/kitty",
        repository_id = 71056775,
        tag = "v{version}",
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.49.0",
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}-{target}.txz",
            },
            outputs = {
                bins = {
                    kitten = "bin/kitten",
                    kitty = "bin/kitty",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.49.0",
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
                apps = {
                    ["kitty.app"] = "kitty.app",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.49.0",
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}-{target}.txz",
            },
            outputs = {
                bins = {
                    kitten = "bin/kitten",
                    kitty = "bin/kitty",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
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
        ["0.49.0"] = {
            digests = {
                ["aarch64-linux"] = "e7a0b9187f160d88a6dd9d836e523a24d7d35502e0afb46645c757c9974d26b7",
                ["aarch64-macos"] = "8cc20fb30e95a5141ad5434516fca33177233a7f49236d431baf9ce90583e98c",
                ["x86_64-linux"] = "ed2c015dcdea52bad5cb70461944e487af6c3f79eff4a6542717fcd315feaec2",
            },
        },
    },
}
