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
            default_version = "2026.11.8",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.8",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.8",
        },
    },
    versions = {
        ["2026.11.7"] = {
            digests = {
                ["aarch64-linux"] = "171dff2204da49e568621a5add90a97c8d99a9e18d588be43bf3060e6089250e",
                ["aarch64-macos"] = "92f1b9f68b6031a9f77938a0ff8dfd7a77fe9cd918c5b09d0ed434f06ebbd3f2",
                ["x86_64-linux"] = "e60e54aaca90e23463cd697d7c9c95858d90198372f15ef95e30aae1b62fed4b",
            },
        },
        ["2026.11.8"] = {
            digests = {
                ["aarch64-linux"] = "8b3b9d3508a4fc1bee5f90b0bea1926f5656f40f58e40374616daeaaf8d3587c",
                ["aarch64-macos"] = "7a7f9342559cc4ca670054337ecf497e69d832a05f66e531628381dc92b88f48",
                ["x86_64-linux"] = "459ac6f5c1581b44987347af09ddcb518ef255631a098e3ec0430982555eb138",
            },
        },
    },
}
