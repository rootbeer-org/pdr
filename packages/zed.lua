return {
    name = "zed",
    description = "Code editor with built-in collaboration",
    homepage = "https://zed.dev/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "zed-industries/zed",
        repository_id = 340547520,
        tag = "v{version}",
    },
    prebuilt = {
        github = "zed-industries/zed",
        tag = "v{version}",
        asset = "Zed-aarch64.dmg",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        bins = {
            zed = "Zed.app/Contents/MacOS/cli",
        },
        apps = {
            ["Zed.app"] = { path = "Zed.app", updates = "self" },
        },
        checks = {
            { "zed", "--version" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.29.3",
        },
    },
    versions = {
        ["1.29.3"] = {
            digests = {
                ["aarch64-macos"] = "b692c9effdfcec874c47f56c3b27df069a63c6b3d23ecd070ffec9238a708bb8",
            },
        },
    },
}
