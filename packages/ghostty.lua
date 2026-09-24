return {
    name = "ghostty",
    description = "Run a GPU-accelerated terminal with native UI",
    homepage = "https://ghostty.org/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    prebuilt = {
        url = "https://release.files.ghostty.org/{version}/Ghostty.dmg",
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
