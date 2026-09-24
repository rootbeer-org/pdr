return {
    name = "raspberry-pi-imager",
    aliases = { "rpi-imager" },
    description = "Write operating system images to SD cards and USB drives",
    homepage = "https://www.raspberrypi.com/software/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
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
            default_version = "2.0.11.1",
        },
    },
    versions = {
        ["2.0.11.1"] = {
            digests = {
                ["aarch64-macos"] = "2b4c5324c5ff04aa3bfb216795ae9e01cb54400752727353e13fb21e66c528a9",
            },
        },
    },
}
