return {
    name = "rustic",
    description = "Back up files with deduplication and encryption",
    homepage = "https://github.com/rustic-rs/rustic",
    default_license = "Apache-2.0",
    upstream = {
        github = "rustic-rs/rustic",
        repository_id = 469809167,
        tag = "v{version}",
    },
    prebuilt = {
        github = "rustic-rs/rustic",
        tag = "v{version}",
        asset = "rustic-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "rustic" },
        checks = {
            { "rustic", "--version" },
            { "rustic", "backup", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.11.4",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.11.4",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.11.4",
        },
    },
    versions = {
        ["0.11.4"] = {
            digests = {
                ["aarch64-linux"] = "35ccd40ff565b9760245dd391f9fef04c46778ce5e073d833288abe2e5eabd20",
                ["aarch64-macos"] = "6df166f68876f1bd1e0965547542374877f04ab498cbb5e19b1b155844bce307",
                ["x86_64-linux"] = "628b26785f3787fa1d52e61b3289493f483230a1ed6e86a84ae9c76d7a41a81e",
            },
            revision = 2,
        },
    },
}
