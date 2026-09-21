return {
    schema = 2,
    name = "google-chrome",
    description = "Web browser",
    homepage = "https://www.google.com/chrome/",
    default_version = "153.0.8010.53",
    inputs = {
        prebuilt = {
            url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Google Chrome.app"] = "Google Chrome.app",
        },
    },
    versions = {
        ["153.0.8010.53"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "f111c12348ff6e184db296071567d81f9da2cb5acc7257d999f9fccc67abea1a",
                    },
                },
            },
        },
    },
}
