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
            default_version = "0.21.2.1",
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
            default_version = "0.21.2.1",
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
            default_version = "0.21.2.1",
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
        ["0.21.1.1"] = {
            digests = {
                ["aarch64-linux"] = "aa0057946abcc66745267a73c7e08d8812a522d7874a42da025f3a0a11fb9c36",
                ["aarch64-macos"] = "e0be38d4b39b8ce120b7c7eeda128ecfba0e6611d5d23f2fbab2e3510c276331",
                ["x86_64-linux"] = "a62bc4081b99709b3117165cf7abe7111d3b544671ab17232f429b9b0544b3fa",
            },
        },
        ["0.21.2.1"] = {
            digests = {
                ["aarch64-linux"] = "221fb1518a045ce0f1cf4e3d3459e7ad80e5e5666c1b2e9af1f86e1f4ebc6028",
                ["aarch64-macos"] = "e8ebb22acdd3500a457b69689c48c586413973d172c9cfa3df2a5f8a7e373844",
                ["x86_64-linux"] = "21d3fe4b2be637eb93fdea208d6b06d7fe9f78ee8c17d80fff9ed233702c066a",
            },
        },
    },
}
