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
            default_version = "0.21.3.1",
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
            default_version = "0.21.3.1",
            upstream = {
                github = "imputnet/helium-macos",
                repository_id = 933200785,
            },
            prebuilt = {
                github = "imputnet/helium-macos",
                tag = "{version}",
                asset = "helium_{version}_arm64-macos.dmg",
                dependencies = {
                    { package = "7zip", kind = "build" },
                },
                mirror = true,
            },
            outputs = {
                apps = {
                    ["Helium.app"] = "Helium.app",
                },
                host = { "/bin/bash" },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.21.3.1",
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
        ["0.21.2.1"] = {
            digests = {
                ["aarch64-linux"] = "221fb1518a045ce0f1cf4e3d3459e7ad80e5e5666c1b2e9af1f86e1f4ebc6028",
                ["aarch64-macos"] = "e8ebb22acdd3500a457b69689c48c586413973d172c9cfa3df2a5f8a7e373844",
                ["x86_64-linux"] = "21d3fe4b2be637eb93fdea208d6b06d7fe9f78ee8c17d80fff9ed233702c066a",
            },
        },
        ["0.21.3.1"] = {
            digests = {
                ["aarch64-linux"] = "f7f3ae03f9a9c55f1b2d420688a86391fd7d3432f1e62588a2e6dd780c154404",
                ["aarch64-macos"] = "3debd0f2f3a3cf0f4bfa5dfbe4d807a3391c17c752178be4449719245ed0610b",
                ["x86_64-linux"] = "a8540596c93a44631605602f3bc4eeda5bff83eb1a3a8b02e4d04a4c8473e29d",
            },
        },
    },
}
