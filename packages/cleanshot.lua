return {
    name = "cleanshot",
    description = "Screen capturing tool",
    homepage = "https://cleanshot.com/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://updates.getcleanshot.com/v3/CleanShot-X-5.0.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["CleanShot X.app"] = "CleanShot X.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.0",
        },
    },
    versions = {
        ["5.0"] = {
            digests = {
                ["aarch64-macos"] = "6f4535f2297ee9166ed7d57d7010cae97417895256ab43a964876a45f9294651",
            },
        },
    },
}
