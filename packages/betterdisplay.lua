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
            ["BetterDisplay.app"] = { path = "BetterDisplay.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.2.1",
        },
    },
    versions = {
        ["5.1.1"] = {
            digests = {
                ["aarch64-macos"] = "533ce08c91a02e0fdca2bc0e461404968ab18d32bbd9fd3314218e1a8d51c1de",
            },
            trees = {
                ["aarch64-macos"] = "45e941fc28929504876831729e43cf30253fcf9c8c5ab47f2cfdc62f8ce366a2",
            },
        },
        ["5.2.1"] = {
            digests = {
                ["aarch64-macos"] = "b61f6f16d536a8eb98f3f6873faa65b0f8c8d8c03f5ad314f2addf630061710c",
            },
            trees = {
                ["aarch64-macos"] = "2be2fdf79a3240690e9671734100b08b73925de115d494c2809b95f734ef7857",
            },
        },
    },
}
