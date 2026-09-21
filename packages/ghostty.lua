return {
    schema = 2,
    name = "ghostty",
    description = "Terminal emulator that uses platform-native UI and GPU acceleration",
    homepage = "https://ghostty.org/",
    default_version = "1.3.1",
    inputs = {
        prebuilt = {
            url = "https://release.files.ghostty.org/1.3.1/Ghostty.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Ghostty.app"] = "Ghostty.app",
        },
    },
    versions = {
        ["1.3.1"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "18cff2b0a6cee90eead9c7d3064e808a252a40baf214aa752c1ecb793b8f5f69",
                    },
                },
            },
        },
    },
}
