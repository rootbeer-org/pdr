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
            default_version = "0.1.0-main+d9df2d1eada1",
        },
    },
    versions = {
        ["0.1.0-main+12763eea146a"] = {
            digests = {
                ["aarch64-macos"] = "430eec694383726e27bdc0a9503608917abe18dd9cb6dc157160163e5599114d",
            },
            commit = "12763eea146a127f12f4f4ed32e104a5c9798729",
            serial = 20261110223431,
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
