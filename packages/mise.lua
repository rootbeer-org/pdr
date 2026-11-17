return {
    name = "mise",
    description = "Manage development tools and tasks",
    homepage = "https://mise.jdx.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "jdx/mise",
        repository_id = 586920414,
        tag = "v{version}",
    },
    prebuilt = {
        github = "jdx/mise",
        tag = "v{version}",
        asset = "mise-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "mise" },
        checks = {
            { "mise", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64-musl",
            default_version = "2026.11.9",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.9",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.9",
        },
    },
    versions = {
        ["2026.11.8"] = {
            digests = {
                ["aarch64-linux"] = "8b3b9d3508a4fc1bee5f90b0bea1926f5656f40f58e40374616daeaaf8d3587c",
                ["aarch64-macos"] = "7a7f9342559cc4ca670054337ecf497e69d832a05f66e531628381dc92b88f48",
                ["x86_64-linux"] = "459ac6f5c1581b44987347af09ddcb518ef255631a098e3ec0430982555eb138",
            },
        },
        ["2026.11.9"] = {
            digests = {
                ["aarch64-linux"] = "5e83d1421adef773f7187fb25a3d6f9b91094d728c7155fcf396b71736f441d7",
                ["aarch64-macos"] = "e4509f159e0492e89065edcf52f2918e2751e3574620586058468ba0563aed59",
                ["x86_64-linux"] = "3ec9f5dcb28da4280107d6904fc399b0c9c3d319d99b6b3c2de8e51e8e7200c1",
            },
        },
    },
}
