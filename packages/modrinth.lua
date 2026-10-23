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
            default_version = "0.22.0",
        },
    },
    versions = {
        ["0.21.10"] = {
            digests = {
                ["aarch64-macos"] = "328384b8a6391b0d5e55305a7a23c8dfadd6c0172cb6575cfb09d177ffabaeae",
            },
        },
        ["0.22.0"] = {
            digests = {
                ["aarch64-macos"] = "b39f9c228f770d4afd3a8ade20378dbf2bef9f2debf9e5cde983e9628bbd063b",
            },
        },
    },
}
