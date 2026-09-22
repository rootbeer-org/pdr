return {
    name = "modrinth",
    description = "Minecraft modding platform",
    homepage = "https://modrinth.com/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://launcher-files.modrinth.com/versions/0.21.4/macos/Modrinth%20App_0.21.4_universal.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = { apps = { ["Modrinth App.app"] = "Modrinth App.app" } },
    platforms = {
        ["aarch64-macos"] = { default_version = "0.21.4" },
    },
    versions = {
        ["0.21.4"] = {
            digests = {
                ["aarch64-macos"] = "72fbe25e951e57c77cefbe28d021a313e01dc4db5e4c01ba037cacfe47d133c7",
            },
        },
    },
}
