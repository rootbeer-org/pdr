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
