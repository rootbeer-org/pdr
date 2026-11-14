return {
    name = "pnpm",
    description = "Fast, disk-efficient package manager for Node.js",
    homepage = "https://pnpm.io",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "pnpm/pnpm",
        repository_id = 50565430,
        tag = "v{version}",
        exclude_tags = { "v*-*" },
    },
    prebuilt = {
        github = "pnpm/pnpm",
        tag = "v{version}",
        asset = "pnpm-{target}.tar.gz",
    },
    outputs = {
        bins = { "pnpm" },
        checks = {
            { "pnpm", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "12.21.0",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "12.21.0",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "12.21.0",
        },
    },
    versions = {
        ["12.21.0"] = {
            digests = {
                ["aarch64-linux"] = "6c5913a48c93b3a556b71c3bd9bf12c6bf9fbfbbbd2dcbd1d52a85c539751b9e",
                ["aarch64-macos"] = "5c4d73018e00dd602531ce714625594fb693cbe110e6719df2b043b0ae62ab1a",
                ["x86_64-linux"] = "84c4773bcf4a217f4083cd7b2a91e4cee6103cf42426c1282ef37d308f55a410",
            },
        },
    },
}
