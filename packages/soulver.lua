return {
    name = "soulver",
    description = "Calculate in natural language notes",
    homepage = "https://soulver.app/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://soulver.app/mac/sparkle/soulver-3.16.3-541.zip",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Soulver 3.app"] = { path = "Soulver 3.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "3.16.3",
        },
    },
    versions = {
        ["3.16.3"] = {
            digests = {
                ["aarch64-macos"] = "5412bb0f5aecf456b2c767ae9ce19e0a34ccaa9c3c0c1d9fe217749eef799d9c",
            },
            trees = {
                ["aarch64-macos"] = "6958e9f0b1e10915e7cdfe624dd74d33e8807b60edd63f3fd50bd30aed415642",
            },
        },
    },
}
