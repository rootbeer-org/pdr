return {
    name = "copilot-money",
    description = "Track and budget money",
    homepage = "https://copilot.money/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://storage.googleapis.com/copilot-mac-releases/images/Copilot-6.4.4-332-80a7fa78.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = { apps = { ["Copilot.app"] = "Copilot.app" } },
    platforms = {
        ["aarch64-macos"] = { default_version = "6.4.4+332-80a7fa78" },
    },
    versions = {
        ["6.4.4+332-80a7fa78"] = {
            digests = {
                ["aarch64-macos"] = "80a7fa78efbb42bcd2db13c040c051146d466dc46df7398712ef2cd914486fe2",
            },
        },
    },
}
