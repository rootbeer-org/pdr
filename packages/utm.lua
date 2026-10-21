return {
    name = "utm",
    description = "Run virtual machines on macOS",
    homepage = "https://mac.getutm.app/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "utmapp/UTM",
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://github.com/utmapp/UTM/releases/download/v{version}/UTM.dmg",
        install = "Dmg",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["UTM.app"] = "UTM.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "5.0.8",
        },
    },
    versions = {
        ["4.7.5"] = {
            digests = {
                ["aarch64-macos"] = "a8435c93cfb5f8bbfeea4b134cfad1ac66b67632b75e438c63b1a8ae043bef0e",
            },
        },
        ["5.0.8"] = {
            digests = {
                ["aarch64-macos"] = "7b2d7b2e2a02b3de1757ef19a8f36573e6d9cceae8c8cca0abcbcaa4a852019a",
            },
        },
    },
}
