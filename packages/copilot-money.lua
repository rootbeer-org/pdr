return {
    schema = 2,
    name = "copilot-money",
    description = "Track and budget money",
    homepage = "https://copilot.money/",
    default_version = "6.4.4+332-80a7fa78",
    inputs = {
        prebuilt = {
            url = "https://storage.googleapis.com/copilot-mac-releases/images/Copilot-6.4.4-332-80a7fa78.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Copilot.app"] = "Copilot.app",
        },
    },
    versions = {
        ["6.4.4+332-80a7fa78"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "80a7fa78efbb42bcd2db13c040c051146d466dc46df7398712ef2cd914486fe2",
                    },
                },
            },
        },
    },
}
