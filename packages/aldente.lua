return {
    schema = 2,
    name = "aldente",
    description = "Menu bar tool to limit maximum charging percentage",
    homepage = "https://apphousekitchen.com/",
    default_version = "1.39.3",
    inputs = {
        prebuilt = {
            url = "https://apphousekitchen.com/aldente/AlDente1.39.3.dmg",
            install = "Dmg",
            mirror = true,
        },
    },
    systems = { "aarch64-macos" },
    outputs = {
        apps = {
            ["AlDente.app"] = "AlDente.app",
        },
    },
    versions = {
        ["1.39.3"] = {
            inputs = {
                prebuilt = {
                    checksums = {
                        ["aarch64-macos"] = "aca6d1a060bb6347a8bb4d239233a1e897ab363cbaec0fea4c078481156af650",
                    },
                },
            },
        },
    },
}
