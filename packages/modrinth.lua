return {
    schema = 2,
    name = "modrinth",
    description = "Minecraft modding platform",
    homepage = "https://modrinth.com/",
    default_version = "0.21.4",
    inputs = {
        prebuilt = {
            url = "https://launcher-files.modrinth.com/versions/0.21.4/macos/Modrinth%20App_0.21.4_universal.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Modrinth App.app"] = "Modrinth App.app",
        },
    },
    versions = {
        ["0.21.4"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "72fbe25e951e57c77cefbe28d021a313e01dc4db5e4c01ba037cacfe47d133c7",
                    },
                },
            },
        },
    },
}
