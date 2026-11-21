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
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["AlDente.app"] = { path = "AlDente.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.40.2",
        },
    },
    versions = {
        ["1.39.4"] = {
            digests = {
                ["aarch64-macos"] = "b2634ae47f5f860fa75f5be0a9ae89b136dbb514003800ed256873f437aa701b",
            },
        },
        ["1.40.2"] = {
            digests = {
                ["aarch64-macos"] = "663b5425c743228962a019ec7ff0ca917f4802a1da79d6cb4a4c6009638bc3dd",
            },
        },
    },
}
