return {
    name = "glide-browser",
    aliases = { "glide" },
    description = "Keyboard-driven web browser based on Firefox",
    homepage = "https://glide-browser.app/",
    recipe_maintainers = { "tale" },
    default_license = "MPL-2.0",
    upstream = {
        github = "glide-browser/glide",
        repository_id = 960899579,
    },
    prebuilt = {
        github = "glide-browser/glide",
        tag = "{version}",
        asset = "glide.macos-aarch64.dmg",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        bins = {
            glide = "Glide.app/Contents/MacOS/glide",
        },
        apps = {
            ["Glide.app"] = { path = "Glide.app", updates = "self" },
        },
        -- XUL's rpath points at the framework inside the bundle, which the
        -- scan doesn't follow.
        host = { "@rpath/ChannelPrefs" },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.1.65a",
        },
    },
    versions = {
        ["0.1.65a"] = {
            digests = {
                ["aarch64-macos"] = "c1b8e9ef1c48d260cc59c0421bf785d07d170b0e1f3fb91968756c9782da4cd6",
            },
        },
    },
}
