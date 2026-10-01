return {
    name = "aldente",
    description = "Limit MacBook battery charging",
    homepage = "https://apphousekitchen.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = {
        sparkle = "https://apphousekitchen.com/aldente/aldenteproappcast.xml",
        public_key = "QXLHUNZcvghym92nG0zfv/ibtTwLOLD7SurlZOJ/TPU=",
    },
    prebuilt = {
        url = "https://apphousekitchen.com/aldente/AlDente{version}.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["AlDente.app"] = "AlDente.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.39.4",
        },
    },
    versions = {
        ["1.39.3"] = {
            digests = {
                ["aarch64-macos"] = "aca6d1a060bb6347a8bb4d239233a1e897ab363cbaec0fea4c078481156af650",
            },
        },
        ["1.39.4"] = {
            digests = {
                ["aarch64-macos"] = "b2634ae47f5f860fa75f5be0a9ae89b136dbb514003800ed256873f437aa701b",
            },
        },
    },
}
