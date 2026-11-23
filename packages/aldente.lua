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
            trees = {
                ["aarch64-macos"] = "d0fad9438d6b38dc9ef576debebc960b45a0d843595c6cd4ab44606c922d46e2",
            },
        },
        ["1.40.2"] = {
            digests = {
                ["aarch64-macos"] = "663b5425c743228962a019ec7ff0ca917f4802a1da79d6cb4a4c6009638bc3dd",
            },
            trees = {
                ["aarch64-macos"] = "90c0a720ee1f62e725752f7d7d6e80c378934d29945b883a5255f9f1ffe22e26",
            },
        },
    },
}
