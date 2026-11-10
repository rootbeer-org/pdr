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
            default_version = "157.0.8103.51",
            outputs = {
                host = { "/bin/bash" },
            },
        },
    },
    versions = {
        ["157.0.8103.51"] = {
            digests = {
                ["aarch64-macos"] = "e72772e792b34c7f4de0f8fefc7c92bb59f1057abdf7e5db3db199cce1daad3f",
            },
        },
    },
}
