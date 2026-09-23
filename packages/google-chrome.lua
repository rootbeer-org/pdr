return {
    name = "google-chrome",
    description = "Web browser",
    homepage = "https://www.google.com/chrome/",
    default_license = "NOASSERTION",
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
            default_version = "153.0.8010.53",
        },
    },
    versions = {
        ["153.0.8010.53"] = {
            digests = {
                ["aarch64-macos"] = "f111c12348ff6e184db296071567d81f9da2cb5acc7257d999f9fccc67abea1a",
            },
        },
    },
}
