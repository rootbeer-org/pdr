return {
    name = "kitty",
    description = "Run a GPU-accelerated terminal emulator",
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
            default_version = "0.50.0",
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
            default_version = "0.50.0",
            prebuilt = {
                github = "kovidgoyal/kitty",
                tag = "v{version}",
                asset = "kitty-{version}.dmg",
                dependencies = {
                    { package = "7zip", kind = "build" },
                },
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
            default_version = "0.50.0",
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
        ["0.49.2"] = {
            digests = {
                ["aarch64-linux"] = "0c81a995614426cccf0fecaf7d104d47cd63bbccf173d14976e9f92e3d60fce6",
                ["aarch64-macos"] = "e524b894145d89cb76b584e3a9691196ae56bfa31d51384a44aa774252b7cef7",
                ["x86_64-linux"] = "d573618b911e9c461bd421b96c13c74c7f1cb2f1ac9c327818d4ff84366cf5c6",
            },
        },
        ["0.50.0"] = {
            digests = {
                ["aarch64-linux"] = "3eb3257081ece4650dd112b2cf1bdbc0d1952d1a3f3934f22949e666e18451ee",
                ["aarch64-macos"] = "cc01acf6db19a1730ef60b3e7cf0f6300feb51199bf17e9cff7ee12d28d74e0c",
                ["x86_64-linux"] = "f04b11775574d6aabfb529b7e734cc0a7d7d12c7df9fb8ec1843e45420e514ee",
            },
        },
    },
}
