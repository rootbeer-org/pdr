return {
    name = "discord",
    description = "Chat with voice, video, and text",
    homepage = "https://discord.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://stable.dl2.discordapp.net/distro/app/stable/osx/universal/{version}/Discord.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Discord.app"] = { path = "Discord.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.0.423",
        },
    },
    versions = {
        ["0.0.423"] = {
            digests = {
                ["aarch64-macos"] = "8edb6957c30e78250909f4f746546077f25e032f9532852c4b1c2f8bfd37beb2",
            },
            trees = {
                ["aarch64-macos"] = "bbb1ab6a9b1fc4a509c43d3f18f24048af068d0ee3e625dd1462c5957270494f",
            },
        },
    },
}
