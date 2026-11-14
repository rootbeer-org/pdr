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
            default_version = "0.37.9",
        },
        ["aarch64-macos"] = {
            target = "mac.arm64",
            default_version = "0.37.9",
        },
        ["x86_64-linux"] = {
            target = "linux.x86_64",
            default_version = "0.37.9",
        },
    },
    versions = {
        ["0.37.8"] = {
            digests = {
                ["aarch64-linux"] = "7a21281e830930be158202b7f8405ba62445613788b4d9708512ffe51f5cce90",
                ["aarch64-macos"] = "2d396b13c479f74deb19cb2161a3f0858f6e03f26f15f8d3b3be982d09ff4484",
                ["x86_64-linux"] = "e39513f958705d30524d55f68b1d46fbef2b46a0da568efd00e6383dee6be44f",
            },
        },
        ["0.37.9"] = {
            digests = {
                ["aarch64-linux"] = "fb180544da945f346757eb64e12f23f5105a6b0ed67846845057861c99cb8d23",
                ["aarch64-macos"] = "b3a3ad44f6c2d92abb49191a2e0dfa16dd1d84a367c97d83074e46af347a0426",
                ["x86_64-linux"] = "e70bb856b8e1cddb249b1e4231c1b1edca1f78167415effbdc9a1e893b6b9a19",
            },
        },
    },
}
