return {
    name = "the-unarchiver",
    description = "Extract archives in many formats",
    homepage = "https://theunarchiver.com/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://dl.devmate.com/com.macpaw.site.theunarchiver/147/1742287964/TheUnarchiver-147.zip",
        mirror = true,
    },
    outputs = {
        apps = {
            ["The Unarchiver.app"] = "The Unarchiver.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "4.3.9",
        },
    },
    versions = {
        ["4.3.9"] = {
            digests = {
                ["aarch64-macos"] = "d0d8dd2e028519ece5eeb0f018b3392f67e1c85053472ccbbaee64e87f173a28",
            },
            trees = {
                ["aarch64-macos"] = "268bec1452984c42fea0a5e126f228aef07d25e53461b0e74cd08936a3c45afc",
            },
        },
    },
}
