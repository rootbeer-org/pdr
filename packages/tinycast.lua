return {
    schema = 2,
    name = "tinycast",
    description = "Tiny, fully native launcher, hotkeys, and clipboard history",
    homepage = "https://github.com/abue-ammar/tinycast",
    default_version = "0.10.23",
    inputs = {
        prebuilt = {
            url = "https://github.com/abue-ammar/tinycast/releases/download/v0.10.23/Tinycast-0.10.23.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Tinycast.app"] = "Tinycast.app",
        },
    },
    versions = {
        ["0.10.23"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "3a1e824db9656a432a01e8e732468342c5fa30e709901855fa2a62a02706707b",
                    },
                },
            },
        },
    },
}
