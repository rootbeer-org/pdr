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
            { package = "7zip", kind = "build" },
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
            default_version = "0.1.0-main+bd1fff8b7cf8",
        },
    },
    versions = {
        ["0.1.0-main+bd1fff8b7cf8"] = {
            digests = {
                ["aarch64-macos"] = "d3149096b94910d6c9634029a105cc6852c51f69666a40fb91af1523b3821de3",
            },
            commit = "bd1fff8b7cf87fe6ca196a4563aa5d156e6f0ebc",
            serial = 20261117225526,
        },
        ["0.1.0-main+d9df2d1eada1"] = {
            digests = {
                ["aarch64-macos"] = "3d91a8d75704d01760987f385583556484bc23c09acb7e14ac4cbad58dbf7ba8",
            },
            commit = "d9df2d1eada164cae9642221cd5ed8911f3d4ad9",
            serial = 20261113234705,
        },
    },
}
