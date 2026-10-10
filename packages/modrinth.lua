return {
    name = "modrinth",
    description = "Launch Minecraft and manage mods",
    homepage = "https://modrinth.com/app",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "modrinth/code",
        repository_id = 378744594,
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://launcher-files.modrinth.com/versions/{version}/macos/Modrinth%20App_{version}_universal.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Modrinth App.app"] = "Modrinth App.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.21.9",
        },
    },
    versions = {
        ["0.21.4"] = {
            digests = {
                ["aarch64-macos"] = "72fbe25e951e57c77cefbe28d021a313e01dc4db5e4c01ba037cacfe47d133c7",
            },
        },
        ["0.21.6"] = {
            digests = {
                ["aarch64-macos"] = "9ef151eed55aafc3e15afe19d4a5eaa376b8f6fd539131dcb04e00db63e68ac7",
            },
        },
        ["0.21.9"] = {
            digests = {
                ["aarch64-macos"] = "10650ed5ebb46b7d9045dea7cec85cc2a3bdd65c48691f195bc9bb1f4ba5337e",
            },
        },
    },
}
