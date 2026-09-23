return {
    name = "raycast",
    description = "Control your tools with a few keystrokes",
    homepage = "https://raycast.com/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://x.raycast-releases.com/download?platform=macos&architecture=arm64&version=2.4.1.0",
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
