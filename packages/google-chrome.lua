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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["Google Chrome.app"] = "Google Chrome.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "156.0.8078.48",
            outputs = {
                host = { "/bin/bash" },
            },
        },
    },
    versions = {
        ["156.0.8078.48"] = {
            digests = {
                ["aarch64-macos"] = "15d9d8a33eeb858667946f1e9d29d2a82619214c89d1bb16ab113cb63ec11355",
            },
        },
    },
}
