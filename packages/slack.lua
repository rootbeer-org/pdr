return {
    name = "slack",
    description = "Chat in team channels and direct messages",
    homepage = "https://slack.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://downloads.slack-edge.com/desktop-releases/mac/arm64/{version}/Slack-{version}-macOS.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Slack.app"] = { path = "Slack.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "4.53.292",
        },
    },
    versions = {
        ["4.53.292"] = {
            digests = {
                ["aarch64-macos"] = "b358a20e933a889e76faa46c581e3d9c59f036dd3be1692eb593db900646006a",
            },
            trees = {
                ["aarch64-macos"] = "2a829e89384060e6ce31b322f971e73a61e46b42701c32a342408db9351f87e8",
            },
        },
    },
}
