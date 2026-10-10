return {
    name = "tinycast",
    description = "Launch apps, bind hotkeys, and browse clipboard history",
    homepage = "https://tinycast.dev",
    recipe_maintainers = { "tale" },
    default_license = "AGPL-3.0-or-later",
    upstream = {
        github = "abue-ammar/tinycast",
        repository_id = 1284153858,
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://github.com/abue-ammar/tinycast/releases/download/v{version}/Tinycast-{version}.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Tinycast.app"] = "Tinycast.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.11.12",
        },
    },
    versions = {
        ["0.10.23"] = {
            digests = {
                ["aarch64-macos"] = "3a1e824db9656a432a01e8e732468342c5fa30e709901855fa2a62a02706707b",
            },
        },
        ["0.11.12"] = {
            digests = {
                ["aarch64-macos"] = "5bf7bf0313c2626141a0b3d5af7c028c7210c61fab4648cfc473b4b23e230534",
            },
        },
        ["0.11.3"] = {
            digests = {
                ["aarch64-macos"] = "c9f00c139648ad999ee2a5b4953f040cacb9875c199167490dd83f1d1d73a977",
            },
        },
    },
}
