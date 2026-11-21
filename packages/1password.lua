return {
    name = "1password",
    description = "Store passwords, passkeys, and secrets",
    homepage = "https://1password.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://downloads.1password.com/mac/1Password-{version}-aarch64.zip",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["1Password.app"] = { path = "1Password.app", updates = "self", location = "system" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "8.12.46",
        },
    },
    versions = {
        ["8.12.46"] = {
            digests = {
                ["aarch64-macos"] = "7f44eecae6a52409748ba5ed6b94d6b383949f628e2cccd3d1e4798fa30461fc",
            },
        },
    },
}
