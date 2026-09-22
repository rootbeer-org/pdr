return {
    name = "raspberry-pi-imager",
    description = "Imaging utility to install operating systems to a microSD card",
    homepage = "https://www.raspberrypi.com/software/",
    default_license = "NOASSERTION",
    prebuilt = {
        url = "https://github.com/raspberrypi/rpi-imager/releases/download/v2.0.11.1/rpi-imager-v2.0.11.1.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = { apps = { ["Raspberry Pi Imager.app"] = "Raspberry Pi Imager.app" } },
    platforms = {
        ["aarch64-macos"] = { default_version = "2.0.11.1" },
    },
    versions = {
        ["2.0.11.1"] = {
            digests = {
                ["aarch64-macos"] = "2b4c5324c5ff04aa3bfb216795ae9e01cb54400752727353e13fb21e66c528a9",
            },
        },
    },
}
