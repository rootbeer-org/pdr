return {
    schema = 2,
    name = "discord",
    description = "Voice and text chat software",
    homepage = "https://discord.com/",
    default_version = "0.0.412",
    inputs = {
        prebuilt = {
            url = "https://dl.discordapp.net/apps/osx/0.0.412/Discord.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Discord.app"] = "Discord.app",
        },
    },
    versions = {
        ["0.0.412"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "5102d468e5593a5ffd5a3ecd38a10e9f63b349e7a3caa074eee8d6532f573a19",
                    },
                },
            },
        },
    },
}
