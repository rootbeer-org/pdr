return {
    name = "betterdisplay",
    description = "Control display scaling, brightness, and virtual screens",
    homepage = "https://betterdisplay.pro/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://github.com/waydabber/BetterDisplay/releases/download/v{version}/BetterDisplay-v{version}.dmg",
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
