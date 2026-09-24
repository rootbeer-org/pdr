return {
    name = "steam",
    description = "Buy, download, and play PC games",
    homepage = "https://store.steampowered.com/about/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://cdn.cloudflare.steamstatic.com/client/installer/steam.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Steam.app"] = "Steam.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "6.0",
        },
    },
    versions = {
        ["6.0"] = {
            digests = {
                ["aarch64-macos"] = "e1abfbaaa7be3e0f48a0e0d4c313233e05861b1d26af32830ddc838be88f2691",
            },
        },
    },
}
