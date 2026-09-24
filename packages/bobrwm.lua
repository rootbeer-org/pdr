return {
    name = "bobrwm",
    description = "Tiling window manager for macOS",
    homepage = "https://github.com/bobrwm/bobrwm",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    prebuilt = {
        github = "bobrwm/bobrwm",
        tag = "tip",
        asset = "bobrwm-tip-34830670144-1-aarch64-macos.zip",
        mirror = true,
    },
    outputs = {
        bins = {
            bobrwm = "Bobrwm.app/Contents/MacOS/bobrwm-cli",
        },
        apps = {
            ["Bobrwm.app"] = "Bobrwm.app",
        },
        checks = {
            { "bobrwm", "--version" },
            { "bobrwm", "--help" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+572265d",
        },
    },
    versions = {
        ["0.1.0-main+572265d"] = {
            digests = {
                ["aarch64-macos"] = "6694c250d7ad887b26013abf1ddbfdaff9d99143a310f9111c97f3493ad396ac",
            },
            revision = 2,
        },
    },
}
