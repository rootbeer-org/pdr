return {
    name = "bobrwm",
    description = "Tiling window manager for macOS",
    homepage = "https://github.com/bobrwm/bobrwm",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "bobrwm/bobrwm",
        repository_id = 999844138,
        rolling = { tag = "tip", version = "0.1.0-main" },
        automerge = true,
    },
    prebuilt = {
        github = "bobrwm/bobrwm",
        tag = "tip",
        asset = "bobrwm-tip-{commit}-aarch64-macos.zip",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
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
            default_version = "0.1.0-main+37dff99b3e09",
        },
    },
    versions = {
        ["0.1.0-main+37dff99b3e09"] = {
            digests = {
                ["aarch64-macos"] = "22fc2198a1c6d91ef84831fb9fe570307a86f0051da1ecae4ad0d96a51d33fbf",
            },
            commit = "37dff99b3e09ccb6bc3048a52ea1117af09a5b72",
            serial = 20261119165332,
        },
        ["0.1.0-main+bd1fff8b7cf8"] = {
            digests = {
                ["aarch64-macos"] = "d3149096b94910d6c9634029a105cc6852c51f69666a40fb91af1523b3821de3",
            },
            commit = "bd1fff8b7cf87fe6ca196a4563aa5d156e6f0ebc",
            serial = 20261117225526,
        },
    },
}
