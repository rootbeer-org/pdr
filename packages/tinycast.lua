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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["Tinycast.app"] = "Tinycast.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.12.11",
        },
    },
    versions = {
        ["0.12.1"] = {
            digests = {
                ["aarch64-macos"] = "e9d3da2c0a1bb3b813ce41cce52934fbd07c04941689cf4e8e58ba3284f796c5",
            },
        },
        ["0.12.11"] = {
            digests = {
                ["aarch64-macos"] = "7ddc5e92896770cd9144e175eeb8700da2cb4832c1c3ce18a51f650747780148",
            },
        },
    },
}
