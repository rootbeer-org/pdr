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
            default_version = "2026.11.7",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "2026.11.7",
        },
        ["x86_64-linux"] = {
            target = "linux-x64-musl",
            default_version = "2026.11.7",
        },
    },
    versions = {
        ["2026.11.6"] = {
            digests = {
                ["aarch64-linux"] = "982a195d32427364beb878e1933b76aa5b1d1ccf82c3aca8cfcc2675666546a2",
                ["aarch64-macos"] = "74cf55e92f6c6b1f166781c36db35db9420a4cbf40d62d85c1b9d5dc76e0ba72",
                ["x86_64-linux"] = "2cc1157b9d75a1c6a63aa7231a047c33b43f273fd2bc545ab51ae9db4f74993a",
            },
        },
        ["2026.11.7"] = {
            digests = {
                ["aarch64-linux"] = "171dff2204da49e568621a5add90a97c8d99a9e18d588be43bf3060e6089250e",
                ["aarch64-macos"] = "92f1b9f68b6031a9f77938a0ff8dfd7a77fe9cd918c5b09d0ed434f06ebbd3f2",
                ["x86_64-linux"] = "e60e54aaca90e23463cd697d7c9c95858d90198372f15ef95e30aae1b62fed4b",
            },
        },
    },
}
