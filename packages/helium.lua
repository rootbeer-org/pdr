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
            default_version = "0.19.4.1",
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
            default_version = "0.19.4.1",
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
            default_version = "0.19.4.1",
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
        ["0.18.2.1"] = {
            digests = {
                ["aarch64-linux"] = "03e6094d329f9d6aad8ad0cc0e4397abb65b3c634829ff49173d50891ce64669",
                ["aarch64-macos"] = "86982d8df340d5a1bf1a0c76ada33d7d26797c6c3424a44afa676159b6a3e3eb",
                ["x86_64-linux"] = "aa6ec4400dd3413f5dd5e633a51408e07cd3f3de0626501cd4e55cdd1364de21",
            },
        },
        ["0.19.4.1"] = {
            digests = {
                ["aarch64-linux"] = "fda0f9e0833d7f1b26297c648a8be14ea9e46604be57a47d4d94e178809c1acb",
                ["aarch64-macos"] = "130e431008f25ded9d52210bdfa866b0ace59d04cdaaff07c77931fbd7f93321",
                ["x86_64-linux"] = "5b2db392b3ed87f24aa844936059d68aca98bc20548eaaa0decfa3c280a2a0a7",
            },
        },
    },
}
