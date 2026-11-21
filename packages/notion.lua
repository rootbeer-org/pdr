return {
    name = "notion",
    description = "Write notes, docs, and wikis",
    homepage = "https://www.notion.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://desktop-release.notion-static.com/Notion-{version}-arm64.dmg",
        install = "Dmg",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
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
        },
    },
}
