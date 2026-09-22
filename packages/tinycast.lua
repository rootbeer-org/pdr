return {
    name = "tinycast",
    description = "Tiny, fully native launcher, hotkeys, and clipboard history",
    homepage = "https://github.com/abue-ammar/tinycast",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://github.com/abue-ammar/tinycast/releases/download/v0.10.23/Tinycast-0.10.23.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = { apps = { ["Tinycast.app"] = "Tinycast.app" } },
    platforms = {
        ["aarch64-macos"] = { default_version = "0.10.23" },
    },
    versions = {
        ["0.10.23"] = {
            digests = {
                ["aarch64-macos"] = "3a1e824db9656a432a01e8e732468342c5fa30e709901855fa2a62a02706707b",
            },
        },
    },
}
