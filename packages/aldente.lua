return {
    name = "aldente",
    description = "Limit MacBook battery charging",
    homepage = "https://apphousekitchen.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
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
            default_version = "1.39.3",
        },
    },
    versions = {
        ["1.39.3"] = {
            digests = {
                ["aarch64-macos"] = "aca6d1a060bb6347a8bb4d239233a1e897ab363cbaec0fea4c078481156af650",
            },
        },
    },
}
