return {
    name = "helium",
    aliases = { "helium-browser" },
    description = "Browse the web with a private Chromium-based browser",
    homepage = "https://helium.computer",
    default_license = "GPL-3.0",
    platforms = {
        ["aarch64-linux"] = {
            target = "arm64",
            default_version = "0.18.1.1",
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
            default_version = "0.18.1.1",
            upstream = {
                github = "imputnet/helium-macos",
                repository_id = 933200785,
            },
            prebuilt = {
                github = "imputnet/helium-macos",
                tag = "{version}",
                asset = "helium_{version}_arm64-macos.dmg",
                mirror = true,
            },
            outputs = {
                apps = {
                    ["Helium.app"] = "Helium.app",
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64",
            default_version = "0.18.1.1",
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
        ["0.17.2.1"] = {
            digests = {
                ["aarch64-linux"] = "167a3f7698179b9cd2e5218c3aad16ec9c13d4159b1a31dc1d4b2791785f3028",
                ["aarch64-macos"] = "f1a3fecde3c08254f1b1eec30e36ecd25f98cf3799644427fbcefd6e6beafacf",
                ["x86_64-linux"] = "0c5caa2ba9eb8d986c7353a876eaae2444de07256779683a075f326c861693b4",
            },
        },
        ["0.18.1.1"] = {
            digests = {
                ["aarch64-linux"] = "df929552ab1ba4486a027b366fe3ed9b3a90291c2227779b44041476eedecad7",
                ["aarch64-macos"] = "418e7339807161cbdac42dba70520679970576d50f5aa4f30a3f0862feb4a1d9",
                ["x86_64-linux"] = "d1e1b993dfbfee06e9f90e8a29cd58e87a475197b04fc0487506227c338569cb",
            },
        },
    },
}
