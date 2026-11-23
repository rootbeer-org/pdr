return {
    name = "sf-symbols",
    description = "Browse and export Apple's symbol library",
    homepage = "https://developer.apple.com/sf-symbols/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    -- Apple serves only the newest release of each major version, so versions
    -- are bumped by hand.
    prebuilt = {
        url = "https://devimages-cdn.apple.com/design/resources/download/SF-Symbols-{major}.dmg",
        install = "Pkg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["SF Symbols.app"] = "SF Symbols.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "27.2+150",
        },
    },
    versions = {
        ["27.2+150"] = {
            digests = {
                ["aarch64-macos"] = "bcf900f9efa96f61c3d470fdf7cb6d5a80b49bf645da44919eb9c1835f02046f",
            },
            trees = {
                ["aarch64-macos"] = "4095da1e9efdcb06c4e906a6f7ee2158f4d21273a20523d38aac8135db3af229",
            },
        },
    },
}
