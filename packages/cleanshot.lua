return {
    name = "cleanshot",
    description = "Capture screenshots and screen recordings",
    homepage = "https://cleanshot.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://updates.getcleanshot.com/v3/CleanShot-X-{version}.dmg",
        install = "Dmg",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["CleanShot X.app"] = { path = "CleanShot X.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.0.2",
        },
    },
    versions = {
        ["5.0"] = {
            digests = {
                ["aarch64-macos"] = "6f4535f2297ee9166ed7d57d7010cae97417895256ab43a964876a45f9294651",
            },
        },
        ["5.0.2"] = {
            digests = {
                ["aarch64-macos"] = "9f0a661dbaf4ed3044e5074250e6f0142b704e047a9bd4d23d35236e98fca5d6",
            },
        },
    },
}
