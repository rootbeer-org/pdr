return {
    name = "discord",
    description = "Chat with voice, video, and text",
    homepage = "https://discord.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://dl.discordapp.net/apps/osx/{version}/Discord.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Discord.app"] = "Discord.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.0.412",
        },
    },
    versions = {
        ["0.0.412"] = {
            digests = {
                ["aarch64-macos"] = "5102d468e5593a5ffd5a3ecd38a10e9f63b349e7a3caa074eee8d6532f573a19",
            },
        },
    },
}
