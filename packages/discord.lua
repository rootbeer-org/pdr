return {
    name = "discord",
    description = "Voice and text chat software",
    homepage = "https://discord.com/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://dl.discordapp.net/apps/osx/0.0.412/Discord.dmg",
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
