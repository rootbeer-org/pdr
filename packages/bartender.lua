return {
    name = "bartender",
    description = "Organize and hide menu bar items",
    homepage = "https://www.macbartender.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://downloads.macbartender.com/Bartender7/updates/7-2-0/Bartender%207.zip",
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
            trees = {
                ["aarch64-macos"] = "6b4ea1671b537624de11b7e9c1956e9d86a306e72e21ae4b251f2c1487351831",
            },
        },
    },
}
