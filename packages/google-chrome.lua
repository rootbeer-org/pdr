return {
    name = "google-chrome",
    aliases = { "chrome" },
    description = "Browse the web with Google's Chromium-based browser",
    homepage = "https://www.google.com/chrome/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Google Chrome.app"] = "Google Chrome.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "154.0.8037.58",
        },
    },
    versions = {
        ["154.0.8037.58"] = {
            digests = {
                ["aarch64-macos"] = "0aea98069829154bfcb6a50220feb063ab57c064da9ab75693f1fdb468a6def4",
            },
        },
    },
}
