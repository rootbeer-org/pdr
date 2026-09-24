return {
    name = "op",
    description = "Access 1Password from the command line",
    homepage = "https://www.1password.dev/cli",
    recipe_maintainers = { "tale" },
    default_license = "LicenseRef-Proprietary",
    prebuilt = {
        url = "https://cache.agilebits.com/dist/1P/op2/pkg/v{version}/op_{target}_v{version}.zip",
        install = {
            Archive = {
                format = "Zip",
                strip_prefix = nil,
            },
        },
    },
    outputs = {
        bins = { "op" },
        checks = {
            { "op", "--version" },
            { "op", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux_arm64",
            default_version = "2.39.0",
        },
        ["aarch64-macos"] = {
            target = "darwin_arm64",
            default_version = "2.39.0",
        },
        ["x86_64-linux"] = {
            target = "linux_amd64",
            default_version = "2.39.0",
        },
    },
    versions = {
        ["2.39.0"] = {
            digests = {
                ["aarch64-linux"] = "829baeff1c07e055cfa132031b1d9f2282ccdf5076258e482caf2fda70aea5d0",
                ["aarch64-macos"] = "05391d3388a0c0b4f602691bedc1ab368541c487b6f14d2e3399743b4682af67",
                ["x86_64-linux"] = "6fba7f376b6c6dec49f41b06408930a43ad064cce103c6a2ce5b3d0413a86434",
            },
        },
    },
}
