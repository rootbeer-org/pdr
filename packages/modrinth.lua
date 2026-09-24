return {
    name = "modrinth",
    description = "Launch Minecraft and manage mods",
    homepage = "https://modrinth.com/app",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
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
            default_version = "0.21.4",
        },
    },
    versions = {
        ["0.21.4"] = {
            digests = {
                ["aarch64-macos"] = "72fbe25e951e57c77cefbe28d021a313e01dc4db5e4c01ba037cacfe47d133c7",
            },
        },
    },
}
