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
            default_version = "0.23.5",
        },
    },
    versions = {
        ["0.23.3"] = {
            digests = {
                ["aarch64-macos"] = "f30056cb2589db6530f61fdfff15c40bba56ee44aaa8c889072c2ca1a3cdd5ed",
            },
            trees = {
                ["aarch64-macos"] = "9a254c031a901fe68a2d183e86a5bc42850567562f1b10d0218a698035bfb340",
            },
        },
        ["0.23.5"] = {
            digests = {
                ["aarch64-macos"] = "2897dc8ce8ea734c7b3d883d66db2e9001a526ab14a88d30e57e5acfcc3b21e2",
            },
            trees = {
                ["aarch64-macos"] = "943faf594fbf51ba1b6eac91995779a820afcc0d5dd9fa254c29359d95e80015",
            },
        },
    },
}
