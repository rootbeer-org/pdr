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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["Modrinth App.app"] = "Modrinth App.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.23.3",
        },
    },
    versions = {
        ["0.23.2"] = {
            digests = {
                ["aarch64-macos"] = "5c8c5022278e8545b8bbbe20ccf25c4031c1319bb199d6504b434e50fb4d2a49",
            },
        },
        ["0.23.3"] = {
            digests = {
                ["aarch64-macos"] = "f30056cb2589db6530f61fdfff15c40bba56ee44aaa8c889072c2ca1a3cdd5ed",
            },
        },
    },
}
