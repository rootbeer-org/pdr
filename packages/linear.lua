return {
    name = "linear",
    description = "Plan and track software projects",
    homepage = "https://linear.app/",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://releases.linear.app/Linear-{version}-universal.dmg",
        install = "Dmg",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Linear.app"] = { path = "Linear.app", updates = "self" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "1.32.8",
        },
    },
    versions = {
        ["1.32.8"] = {
            digests = {
                ["aarch64-macos"] = "08d42b917bc44068231d47a9e14ae9fdac2ca95fa6b451e810fcda0f756ed4a3",
            },
            trees = {
                ["aarch64-macos"] = "9dca54530760197c77d48be1706f4a34b2dcb3e306c1474f0520d121aab09cdf",
            },
        },
    },
}
