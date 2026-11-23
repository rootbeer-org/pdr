return {
    name = "notion-calendar",
    description = "Schedule meetings across calendars",
    homepage = "https://www.notion.com/product/calendar",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://calendar-desktop-release.notion-static.com/Notion%20Calendar-darwin-arm64-{version}.zip",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Notion Calendar.app"] = { path = "Notion Calendar.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.144.0",
        },
    },
    versions = {
        ["1.144.0"] = {
            digests = {
                ["aarch64-macos"] = "de46c810ed1a20e479052f65b43aac40c19c0e51236be2ebf7aed9cf7c50c7bb",
            },
            trees = {
                ["aarch64-macos"] = "046a8563b91eb0a34ec8cfbc37b6933de7c56f16c5c08783aa95cd2a24dcfb8f",
            },
        },
    },
}
