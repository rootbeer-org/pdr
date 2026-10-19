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
            default_version = "155.0.8059.80",
            outputs = {
                host = { "/bin/bash" },
            },
        },
    },
    versions = {
        ["155.0.8059.80"] = {
            digests = {
                ["aarch64-macos"] = "3262c73156ebc81efe44b68aab35cef8363d34e27e18750a63fc18b5de52f738",
            },
        },
    },
}
