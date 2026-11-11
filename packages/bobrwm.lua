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
            default_version = "0.1.0-main+12763eea146a",
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
        ["0.1.0-main+6da7e2775ee9"] = {
            digests = {
                ["aarch64-macos"] = "8a7a0e97b3f9adc1c934987df6d4c4d4aa611d4c3ad968b8859e577af066a39c",
            },
            commit = "6da7e2775ee9368c6b2228fc4e109f117be911dc",
            serial = 20261106132907,
        },
    },
}
