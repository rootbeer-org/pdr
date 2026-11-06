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
            default_version = "0.1.0-main+6da7e2775ee9",
        },
    },
    versions = {
        ["0.1.0-main+6da7e2775ee9"] = {
            digests = {
                ["aarch64-macos"] = "8a7a0e97b3f9adc1c934987df6d4c4d4aa611d4c3ad968b8859e577af066a39c",
            },
            commit = "6da7e2775ee9368c6b2228fc4e109f117be911dc",
            serial = 20261106132907,
        },
        ["0.1.0-main+875d6324799d"] = {
            digests = {
                ["aarch64-macos"] = "8e27c51997ba7892f13e109790a46c66d20ce2bc00a1f5ddb63907bb7de90c22",
            },
            commit = "875d6324799d9dfc9513d2bf8349838eb9729802",
            serial = 20261030155917,
        },
    },
}
