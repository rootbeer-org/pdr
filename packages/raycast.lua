return {
    name = "raycast",
    description = "Launch apps and run extensions from a command bar",
    homepage = "https://www.raycast.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://x.raycast-releases.com/download?platform=macos&architecture=arm64&version={version}",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Raycast.app"] = "Raycast.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2.4.1.0",
        },
    },
    versions = {
        ["2.4.1.0"] = {
            digests = {
                ["aarch64-macos"] = "5bb09adafcf8070605264bb29fcf496e4d615da3a6a0ce88eab70653d186a795",
            },
        },
    },
}
