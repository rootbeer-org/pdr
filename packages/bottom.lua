return {
    name = "bottom",
    description = "Monitor processes and system resources",
    homepage = "https://github.com/ClementTsang/bottom",
    default_license = "MIT",
    prebuilt = {
        github = "ClementTsang/bottom",
        tag = "{version}",
        asset = "bottom_{target}.tar.gz",
    },
    outputs = { bins = { "btm" }, checks = { { "btm", "--version" }, { "btm", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.14.9",
            upstream = {
                github = "ClementTsang/bottom",
                repository_id = 205042455,
                tag_prefix = "",
            },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.14.9",
            upstream = {
                github = "ClementTsang/bottom",
                repository_id = 205042455,
                tag_prefix = "",
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.14.9",
            upstream = {
                github = "ClementTsang/bottom",
                repository_id = 205042455,
                tag_prefix = "",
            },
        },
    },
    versions = {
        ["0.14.9"] = {
            digests = {
                ["aarch64-linux"] = "7b6d532f6a6af356970f4e8d7d3a792590485aa4a53ebf038e10d20366125533",
                ["aarch64-macos"] = "28358e19a3d62b3778fc0d1778b0028a682059145c9ac38ac5076bf124d77714",
                ["x86_64-linux"] = "b4bee5b193e7d3f6e090ac14f0ca15acec2e7fe4ef64988e0bfc492e16c28c9a",
            },
            revision = 2,
        },
    },
}
