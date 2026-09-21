return {
    schema = 2,
    name = "cleanshot",
    description = "Screen capturing tool",
    homepage = "https://cleanshot.com/",
    default_version = "5.0",
    inputs = {
        prebuilt = {
            url = "https://updates.getcleanshot.com/v3/CleanShot-X-5.0.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["CleanShot X.app"] = "CleanShot X.app",
        },
    },
    versions = {
        ["5.0"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "6f4535f2297ee9166ed7d57d7010cae97417895256ab43a964876a45f9294651",
                    },
                },
            },
        },
    },
}
