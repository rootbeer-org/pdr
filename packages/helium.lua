return {
    name = "helium",
    aliases = { "helium-browser" },
    description = "Browse the web with a private Chromium-based browser",
    homepage = "https://helium.computer",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.22.1.1",
            upstream = {
                github = "imputnet/helium-linux",
                repository_id = 1043354934,
            },
            prebuilt = {
                github = "imputnet/helium-linux",
                tag = "{version}",
                asset = "helium-{tag}-{target}.AppImage",
            },
            outputs = {
                bins = { "helium" },
                checks = {
                    { "helium", "--appimage-version" },
                    { "helium", "--appimage-extract", "opt/helium/helium" },
                },
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.22.1.1",
            upstream = {
                github = "imputnet/helium-macos",
                repository_id = 933200785,
            },
            prebuilt = {
                github = "imputnet/helium-macos",
                tag = "{version}",
                asset = "helium_{version}_arm64-macos.dmg",
                dependencies = {
                    { package = "rb-unpack", kind = "build" },
                },
                mirror = true,
            },
            outputs = {
                apps = {
                    ["Helium.app"] = { path = "Helium.app", updates = "self" },
                },
                host = { "/bin/bash" },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.22.1.1",
            upstream = {
                github = "imputnet/helium-linux",
                repository_id = 1043354934,
            },
            prebuilt = {
                github = "imputnet/helium-linux",
                tag = "{version}",
                asset = "helium-{tag}-{target}.AppImage",
            },
            outputs = {
                bins = { "helium" },
                checks = {
                    { "helium", "--appimage-version" },
                    { "helium", "--appimage-extract", "opt/helium/helium" },
                },
            },
        },
    },
    versions = {
        ["0.21.3.1"] = {
            digests = {
                ["aarch64-linux"] = "f7f3ae03f9a9c55f1b2d420688a86391fd7d3432f1e62588a2e6dd780c154404",
                ["aarch64-macos"] = "3debd0f2f3a3cf0f4bfa5dfbe4d807a3391c17c752178be4449719245ed0610b",
                ["x86_64-linux"] = "a8540596c93a44631605602f3bc4eeda5bff83eb1a3a8b02e4d04a4c8473e29d",
            },
        },
        ["0.22.1.1"] = {
            digests = {
                ["aarch64-linux"] = "e3e049fdc15f1c3b1853e6b3acebee5c88db0bb867276ab40c58f5ba54794d0b",
                ["aarch64-macos"] = "8c234480c01223c9dbc9e8dc5bc5be08b8e4341437d62dae9d75942b594fbd51",
                ["x86_64-linux"] = "af4684e0e351a68534dc33443b369d02bc3ac2633734c97848c8a7439bcbb367",
            },
        },
    },
}
