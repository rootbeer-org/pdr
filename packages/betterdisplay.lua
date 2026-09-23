return {
    name = "betterdisplay",
    description = "Display management tool",
    homepage = "https://betterdisplay.pro/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://github.com/waydabber/BetterDisplay/releases/download/v5.0.5/BetterDisplay-v5.0.5.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["BetterDisplay.app"] = "BetterDisplay.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.0.5",
        },
    },
    versions = {
        ["5.0.5"] = {
            digests = {
                ["aarch64-macos"] = "5685565b3f07952c697b6d7884ff5c410a7070ea30b2eb282a93f831fe773752",
            },
        },
    },
}
