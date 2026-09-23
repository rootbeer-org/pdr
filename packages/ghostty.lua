return {
    name = "ghostty",
    description = "Terminal emulator that uses platform-native UI and GPU acceleration",
    homepage = "https://ghostty.org/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://release.files.ghostty.org/1.3.1/Ghostty.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Ghostty.app"] = "Ghostty.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.3.1",
        },
    },
    versions = {
        ["1.3.1"] = {
            digests = {
                ["aarch64-macos"] = "18cff2b0a6cee90eead9c7d3064e808a252a40baf214aa752c1ecb793b8f5f69",
            },
        },
    },
}
