return {
    name = "copilot-money",
    description = "Track personal finances and budgets",
    homepage = "https://www.copilot.money/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://storage.googleapis.com/copilot-mac-releases/images/Copilot-6.8.2-340-69efc0f9.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Copilot.app"] = { path = "Copilot.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "6.8.2+340-69efc0f9",
        },
    },
    versions = {
        ["6.8.2+340-69efc0f9"] = {
            digests = {
                ["aarch64-macos"] = "69efc0f91a7e16f4b4c6d468ac39e555b77f74e9e45d1c9116b48cd7bd602ce8",
            },
            trees = {
                ["aarch64-macos"] = "e999a0023179ec0ccbab10e13c6c9309825f64b1297a903306eb0625f29b3650",
            },
        },
    },
}
