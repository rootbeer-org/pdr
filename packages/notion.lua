return {
    name = "notion",
    description = "Write notes, docs, and wikis",
    homepage = "https://www.notion.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://desktop-release.notion-static.com/Notion-{version}-arm64.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Notion.app"] = { path = "Notion.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "7.44.1",
        },
    },
    versions = {
        ["7.44.1"] = {
            digests = {
                ["aarch64-macos"] = "fe9d2db639d202e758ecda773a0367a07e1fae03ae885ded1a458e77cd7b2f43",
            },
            trees = {
                ["aarch64-macos"] = "cc9dcadb8b3adb8158c225850b47a2632c1b746e16db11d3b26df5a1e868568b",
            },
        },
    },
}
