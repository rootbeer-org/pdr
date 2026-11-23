return {
    name = "google-chrome",
    aliases = { "chrome" },
    description = "Google's web browser",
    homepage = "https://www.google.com/chrome/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Google Chrome.app"] = {
                path = "Google Chrome.app",
                updates = "self",
            },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "158.0.8127.37",
            outputs = {
                host = { "/bin/bash" },
            },
        },
    },
    versions = {
        ["158.0.8127.37"] = {
            digests = {
                ["aarch64-macos"] = "75b9fdb7573aab8a89f1b00319692a1f785fb4e6fd07e97916a13b00b3d34bae",
            },
            trees = {
                ["aarch64-macos"] = "57b9235182ff60731812b071969d8b33b165e418aff36943f82a388674d932fa",
            },
        },
    },
}
