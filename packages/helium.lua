return {
    name = "helium",
    aliases = { "helium-browser" },
    description = "Privacy-focused web browser based on Chromium",
    homepage = "https://helium.computer",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.22.2.1",
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
            default_version = "0.22.2.1",
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
            default_version = "0.22.2.1",
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
        ["0.22.1.1"] = {
            digests = {
                ["aarch64-linux"] = "e3e049fdc15f1c3b1853e6b3acebee5c88db0bb867276ab40c58f5ba54794d0b",
                ["aarch64-macos"] = "8c234480c01223c9dbc9e8dc5bc5be08b8e4341437d62dae9d75942b594fbd51",
                ["x86_64-linux"] = "af4684e0e351a68534dc33443b369d02bc3ac2633734c97848c8a7439bcbb367",
            },
        },
        ["0.22.2.1"] = {
            digests = {
                ["aarch64-linux"] = "0b2c823f524971b11d7db3caaca1567d01896e55b3485e72edaddf34720d7889",
                ["aarch64-macos"] = "c3353aa936844613210203c947c3d315deb3255c78d09293141c447dd324c388",
                ["x86_64-linux"] = "f090c811253fd68bc7eb894b982a0be221d1701f77ed4b53f6146499af8bae04",
            },
        },
    },
}
