return {
    name = "bobrwm",
    description = "Tiling window manager for macOS",
    homepage = "https://github.com/bobrwm/bobrwm",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "bobrwm/bobrwm",
        repository_id = 999844138,
        rolling = { tag = "tip", version = "0.1.0-main" },
        automerge = true,
    },
    prebuilt = {
        github = "bobrwm/bobrwm",
        tag = "tip",
        asset = "bobrwm-tip-{commit}-aarch64-macos.zip",
        mirror = true,
    },
    outputs = {
        bins = {
            bobrwm = "Bobrwm.app/Contents/MacOS/bobrwm-cli",
        },
        apps = {
            ["Bobrwm.app"] = "Bobrwm.app",
        },
        checks = {
            { "bobrwm", "--version" },
            { "bobrwm", "--help" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.1.0-main+14960e9e58a0",
        },
    },
    versions = {
        ["0.1.0-main+14960e9e58a0"] = {
            digests = {
                ["aarch64-macos"] = "262571cfd078600acb6a1dc2c87de44019c579a0ce7b7b49ff29ed8d26e2a935",
            },
            trees = {
                ["aarch64-macos"] = "1e2ea25eb68eece41540de759e6a3adf648f4075f5ec46088c14f1a298e98bd8",
            },
            commit = "14960e9e58a023598896c3dc1dd4eaba50a27650",
            serial = 20261122131500,
        },
        ["0.1.0-main+37dff99b3e09"] = {
            digests = {
                ["aarch64-macos"] = "22fc2198a1c6d91ef84831fb9fe570307a86f0051da1ecae4ad0d96a51d33fbf",
            },
            trees = {
                ["aarch64-macos"] = "b9d5780e83c85024f99096c7ec5feed109603f8a6112e1a2dcb36ef70ebc1745",
            },
            commit = "37dff99b3e09ccb6bc3048a52ea1117af09a5b72",
            serial = 20261119165332,
        },
    },
}
