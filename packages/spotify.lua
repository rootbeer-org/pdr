return {
    name = "spotify",
    description = "Stream music and podcasts",
    homepage = "https://www.spotify.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = { latest = true },
    prebuilt = {
        url = "https://download.scdn.co/SpotifyARM64.dmg",
        install = "Dmg",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["Spotify.app"] = { path = "Spotify.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.3.10.2586",
        },
    },
    versions = {
        ["1.3.10.2586"] = {
            digests = {
                ["aarch64-macos"] = "8344d3307e53736d803642be4fb37f6c0253850b525b9ee5f8f3e2bbf8c32d93",
            },
        },
    },
}
