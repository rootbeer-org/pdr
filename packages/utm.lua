return {
    name = "utm",
    description = "Run virtual machines on macOS",
    homepage = "https://mac.getutm.app/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    prebuilt = {
        url = "https://github.com/utmapp/UTM/releases/download/v{version}/UTM.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["UTM.app"] = "UTM.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "4.7.5",
        },
    },
    versions = {
        ["4.7.5"] = {
            digests = {
                ["aarch64-macos"] = "a8435c93cfb5f8bbfeea4b134cfad1ac66b67632b75e438c63b1a8ae043bef0e",
            },
        },
    },
}
