return {
    name = "betterdisplay",
    description = "Control display scaling, brightness, and virtual screens",
    homepage = "https://betterdisplay.pro/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = {
        github = "waydabber/BetterDisplay",
        repository_id = 420628737,
        tag = "v{version}",
    },
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
            default_version = "5.1.1",
        },
    },
    versions = {
        ["5.0.5"] = {
            digests = {
                ["aarch64-macos"] = "5685565b3f07952c697b6d7884ff5c410a7070ea30b2eb282a93f831fe773752",
            },
        },
        ["5.0.6"] = {
            digests = {
                ["aarch64-macos"] = "a266c9f88244edb4895d98e0c75900cd57a0d47088f962a3d9bf5c14c5197d50",
            },
        },
        ["5.1.1"] = {
            digests = {
                ["aarch64-macos"] = "533ce08c91a02e0fdca2bc0e461404968ab18d32bbd9fd3314218e1a8d51c1de",
            },
        },
    },
}
