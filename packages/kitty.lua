return {
    name = "kitty",
    description = "GPU-accelerated terminal emulator",
    homepage = "https://sw.kovidgoyal.net/kitty/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "kovidgoyal/kitty",
        repository_id = 71056775,
        tag = "v{version}",
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.51.0",
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
                host = {
                    "libX11-xcb.so.1",
                    "libX11.so.6",
                    "libXcursor.so.1",
                    "libbrotlicommon.so.1",
                    "libdbus-1.so.3",
                    "libfontconfig.so.1",
                    "libiconv.so.2",
                    "libpanelw.so.6",
                    "libpcre2-8.so.0",
                    "libsqlite3.so",
                    "libuuid.so.1",
                    "libwayland-client.so.0",
                    "libxcb-xkb.so.1",
                    "libxcb.so.1",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.51.0",
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
                host = {
                    "@executable_path/../Frameworks/libexpat.1.dylib",
                    "@executable_path/../Frameworks/liblzma.5.dylib",
                    "@executable_path/../Frameworks/libsqlite3.dylib",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.51.0",
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
                host = {
                    "libX11-xcb.so.1",
                    "libX11.so.6",
                    "libXcursor.so.1",
                    "libbrotlicommon.so.1",
                    "libdbus-1.so.3",
                    "libfontconfig.so.1",
                    "libiconv.so.2",
                    "libpanelw.so.6",
                    "libpcre2-8.so.0",
                    "libsqlite3.so",
                    "libuuid.so.1",
                    "libwayland-client.so.0",
                    "libxcb-xkb.so.1",
                    "libxcb.so.1",
                },
                checks = {
                    { "kitty", "--version" },
                    { "kitten", "--version" },
                },
            },
        },
    },
    versions = {
        ["0.50.0"] = {
            digests = {
                ["aarch64-linux"] = "3eb3257081ece4650dd112b2cf1bdbc0d1952d1a3f3934f22949e666e18451ee",
                ["aarch64-macos"] = "cc01acf6db19a1730ef60b3e7cf0f6300feb51199bf17e9cff7ee12d28d74e0c",
                ["x86_64-linux"] = "f04b11775574d6aabfb529b7e734cc0a7d7d12c7df9fb8ec1843e45420e514ee",
            },
            trees = {
                ["aarch64-linux"] = "91b58305e634d2bf4fb988a5c1feb5ea27370c1a2acda761f0451062df4f6fdb",
                ["aarch64-macos"] = "ac75e4b7a490d62a15550d434ab889cdb210dd7ab86dccb34eb266e483fdec5b",
                ["x86_64-linux"] = "bdd90da3d17cdaf2032186620d308a589173612458e7867cad440f68f1035444",
            },
        },
        ["0.51.0"] = {
            digests = {
                ["aarch64-linux"] = "2a3eab469c37b548c5ceecff4b500a5b6b5c50f99cc17e0213e06a4c9662d31a",
                ["aarch64-macos"] = "e7d51ec9f1978ff2fee61647b6f7eb59530e06d9bb1af876b00357ca7779638d",
                ["x86_64-linux"] = "c285daaf1b699997614939c8d1cd92dd8b99302ff12f18efcc3f69382aa72b1d",
            },
            trees = {
                ["aarch64-linux"] = "eeb325138be8b57d7bae18599a1970ab35fdb745ea3cb8890e4f7fc4df17fa26",
                ["aarch64-macos"] = "16ad12cc6a37fd0f36f7d27d43299295c596b22b5dd54386ea4bbfb2f72fc9fa",
                ["x86_64-linux"] = "4ad2951013b3678df3178181382cfd4690db91e535d4cd778d92b8645a8cf507",
            },
        },
    },
}
