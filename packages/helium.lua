return {
    schema = 2,
    name = "helium",
    description = "Browse the web with a private Chromium-based browser",
    homepage = "https://helium.computer",
    default_version = "0.17.2.1",
    upstream = {
        github = "imputnet/helium-linux",
        repository_id = 1043354934,
    },
    inputs = {
        prebuilt = {
            github = "imputnet/helium-linux",
            tag = "{version}",
            assets = {
                ["aarch64-linux"] = "helium-{tag}-arm64.AppImage",
                ["x86_64-linux"] = "helium-{tag}-x86_64.AppImage",
            },
        },
    },
    systems = { "aarch64-linux", "x86_64-linux" },
    outputs = {
        bins = { "helium" },
        checks = {
            { "helium", "--appimage-version" },
            { "helium", "--appimage-extract", "opt/helium/helium" },
        },
    },
    versions = {
        ["0.17.2.1"] = {},
    },
}
