return {
    name = "orbstack",
    description = "Run Docker containers and Linux machines on macOS",
    homepage = "https://orbstack.dev/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    upstream = {
        sparkle = "https://api-updates.orbstack.dev/arm64/appcast.xml?bucket=99",
        public_key = "nuUHoUatJ4OxpNCGb5NJ7s5WQYBG4iiZ6rm8JCk0sNQ=",
        channel = "stable",
    },
    prebuilt = {
        url = "https://cdn-updates.orbstack.dev/arm64/OrbStack_v2.2.5_21124_arm64.dmg",
        install = "Dmg",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["OrbStack.app"] = { path = "OrbStack.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2.2.5+21124",
        },
    },
    versions = {
        ["2.2.5+21124"] = {
            digests = {
                ["aarch64-macos"] = "f2b887d26a21e0a12147eb005297782794b26f461f77c6b9cdfb57f576ad5e6d",
            },
        },
    },
}
