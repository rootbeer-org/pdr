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
            ["Tinycast.app"] = { path = "Tinycast.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.12.15",
        },
    },
    versions = {
        ["0.12.11"] = {
            digests = {
                ["aarch64-macos"] = "7ddc5e92896770cd9144e175eeb8700da2cb4832c1c3ce18a51f650747780148",
            },
            trees = {
                ["aarch64-macos"] = "b794c09501e0649004d38a38f3a668458e5390bfff8abbb5622328a91b380130",
            },
        },
        ["0.12.15"] = {
            digests = {
                ["aarch64-macos"] = "e9915ddb7b8339428664e22c5ae1d16b506bb4baf7f71d496c37db06e7f44589",
            },
            trees = {
                ["aarch64-macos"] = "6fc781ce175bd1589a3002b0d41c6839a604334b996bf6b205f7fbf0e128e5e3",
            },
        },
    },
}
