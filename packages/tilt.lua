return {
    name = "tilt",
    description = "Develop applications running in Kubernetes",
    homepage = "https://tilt.dev",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "tilt-dev/tilt",
        repository_id = 143896900,
        tag = "v{version}",
    },
    prebuilt = {
        github = "tilt-dev/tilt",
        tag = "v{version}",
        asset = "tilt.{version}.{target}.tar.gz",
    },
    outputs = {
        bins = { "tilt" },
        checks = {
            { "tilt", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux.arm64",
            default_version = "0.37.7",
        },
        ["aarch64-macos"] = {
            target = "mac.arm64",
            default_version = "0.37.7",
        },
        ["x86_64-linux"] = {
            target = "linux.x86_64",
            default_version = "0.37.7",
        },
    },
    versions = {
        ["0.37.7"] = {
            digests = {
                ["aarch64-linux"] = "9f381347fa18ffca3f1d3dcdd3f6745281a6647e6107199832ceaa62a461964a",
                ["aarch64-macos"] = "7f54afff29cae67e2751c13df00a66d56f6fbc4463573089059ba673cf128687",
                ["x86_64-linux"] = "b695193fab68def8310cb971fa60bbe47ba0a782e24f54ebad287c13316a61b0",
            },
            revision = 2,
        },
    },
}
