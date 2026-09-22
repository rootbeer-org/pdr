return {
    name = "utm",
    description = "Virtual machines UI using QEMU",
    homepage = "https://mac.getutm.app/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://github.com/utmapp/UTM/releases/download/v4.7.5/UTM.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = { apps = { ["UTM.app"] = "UTM.app" } },
    platforms = {
        ["aarch64-macos"] = { default_version = "4.7.5" },
    },
    versions = {
        ["4.7.5"] = {
            digests = {
                ["aarch64-macos"] = "a8435c93cfb5f8bbfeea4b134cfad1ac66b67632b75e438c63b1a8ae043bef0e",
            },
        },
    },
}
