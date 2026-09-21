return {
    schema = 2,
    name = "raspberry-pi-imager",
    description = "Imaging utility to install operating systems to a microSD card",
    homepage = "https://www.raspberrypi.com/software/",
    default_version = "2.0.11.1",
    inputs = {
        prebuilt = {
            url = "https://github.com/raspberrypi/rpi-imager/releases/download/v2.0.11.1/rpi-imager-v2.0.11.1.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["Raspberry Pi Imager.app"] = "Raspberry Pi Imager.app",
        },
    },
    versions = {
        ["2.0.11.1"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "2b4c5324c5ff04aa3bfb216795ae9e01cb54400752727353e13fb21e66c528a9",
                    },
                },
            },
        },
    },
}
