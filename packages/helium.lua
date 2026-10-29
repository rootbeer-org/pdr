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
            default_version = "0.20.2.1",
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
            default_version = "0.20.2.1",
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
            default_version = "0.20.2.1",
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
        ["0.20.1.1"] = {
            digests = {
                ["aarch64-linux"] = "0ace4ed79901c89db9a4759458026644f1b4cdfc44332be9e39f2956920f9d52",
                ["aarch64-macos"] = "5a11718ea2237a1e59f2c84facf2166abdb80773399085d6cd7845d73f1d739a",
                ["x86_64-linux"] = "d4b789b25d0a9ae12c76671e444e8a85edcf828e0419c678d18c41fb1ac3030e",
            },
        },
        ["0.20.2.1"] = {
            digests = {
                ["aarch64-linux"] = "483a45bcf9a3e618eb46ff34113abaef017f51bc59dde0b535a13d04fe93b239",
                ["aarch64-macos"] = "2cbf7d21e10df46c58a2cf5bd9bfa58115d60219192c7dda3424bef3e92aa319",
                ["x86_64-linux"] = "ac4928424d31c863fff3ab75d3be873dfc92ede00e6889634dcbc5881a120397",
            },
        },
    },
}
