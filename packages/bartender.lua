return {
    name = "bartender",
    description = "Organize and hide menu bar items",
    homepage = "https://www.macbartender.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://downloads.macbartender.com/Bartender7/updates/7-2-0/Bartender%207.zip",
        dependencies = {
            { package = "rb-unpack", kind = "build" },
        },
        mirror = true,
    },
    outputs = {
        apps = {
            ["Bartender 7.app"] = { path = "Bartender 7.app", updates = "self" },
        },
        -- Its now playing adapter runs the system perl that macOS ships.
        host = { "/usr/bin/perl" },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "7.2.0",
        },
    },
    versions = {
        ["7.2.0"] = {
            digests = {
                ["aarch64-macos"] = "567d1548e7867b23bd900b8cdcea9e5a881797d8b417a53ef1592976febdc7b4",
            },
        },
    },
}
