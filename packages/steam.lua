return {
    schema = 2,
    name = "steam",
    description = "Video game digital distribution service",
    homepage = "https://store.steampowered.com/about/",
    default_version = "6.0",
    inputs = {
        prebuilt = {
            url = "https://cdn.cloudflare.steamstatic.com/client/installer/steam.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Steam.app"] = "Steam.app",
        },
    },
    versions = {
        ["6.0"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "e1abfbaaa7be3e0f48a0e0d4c313233e05861b1d26af32830ddc838be88f2691",
                    },
                },
            },
        },
    },
}
