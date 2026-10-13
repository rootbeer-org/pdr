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
            { package = "7zip", version = "26.04", kind = "build" },
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
            default_version = "154.0.8037.93",
        },
    },
    versions = {
        ["154.0.8037.93"] = {
            digests = {
                ["aarch64-macos"] = "3fc2451a527e36153247fd9e3a73f6c4a99a0ef206801a7ea26fe896050efe7b",
            },
        },
    },
}
