return {
    name = "raspberry-pi-imager",
    aliases = { "rpi-imager" },
    description = "Write operating system images to SD cards and USB drives",
    homepage = "https://www.raspberrypi.com/software/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "raspberrypi/rpi-imager",
        tag = "v{version}",
    },
    prebuilt = {
        url = "https://github.com/raspberrypi/rpi-imager/releases/download/v{version}/rpi-imager-v{version}.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Raspberry Pi Imager.app"] = "Raspberry Pi Imager.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "2.0.12",
        },
    },
    versions = {
        ["2.0.11.1"] = {
            digests = {
                ["aarch64-macos"] = "2b4c5324c5ff04aa3bfb216795ae9e01cb54400752727353e13fb21e66c528a9",
            },
            trees = {
                ["aarch64-macos"] = "7252b82185eb30206c5538d8ea421fe28d330b847676e9fb7bffc426923715f7",
            },
        },
        ["2.0.12"] = {
            digests = {
                ["aarch64-macos"] = "15b1a94c712c0032750855653c2bf129dceb401329fbce0a83d7cf05dc58a421",
            },
            trees = {
                ["aarch64-macos"] = "6c29234bc4d772ecc3ec6f92358ec2aef3a309a31474f11a10efd99a27e2b12b",
            },
        },
    },
}
