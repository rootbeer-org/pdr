return {
    name = "ghostty",
    description = "Terminal emulator with a native UI",
    homepage = "https://ghostty.org/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "ghostty-org/ghostty",
        tag = "v{version}",
    },
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
            default_version = "1.4.0",
        },
    },
    versions = {
        ["1.3.1"] = {
            digests = {
                ["aarch64-macos"] = "18cff2b0a6cee90eead9c7d3064e808a252a40baf214aa752c1ecb793b8f5f69",
            },
            trees = {
                ["aarch64-macos"] = "ef61576d8052f00b4920904e785923da9768023076ecbb295dfa88a5052a0f38",
            },
        },
        ["1.4.0"] = {
            digests = {
                ["aarch64-macos"] = "3a02075dbd24318d778426af41dee5507d53ecc4578ede96912ec9ce6d18d3e8",
            },
            trees = {
                ["aarch64-macos"] = "5ef8a0df5cdcc62a9cd5ae15454ed23995e9454c09a77cfccbbb85bde0caa3ce",
            },
        },
    },
}
