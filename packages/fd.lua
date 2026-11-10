return {
    name = "fd",
    aliases = { "fd-find" },
    description = "Find files by name",
    homepage = "https://github.com/sharkdp/fd",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "sharkdp/fd",
        repository_id = 90793418,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sharkdp/fd",
        tag = "v{version}",
        asset = "fd-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "fd" },
        checks = {
            { "fd", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "10.5.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "10.5.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "10.5.2",
        },
    },
    versions = {
        ["10.5.0"] = {
            digests = {
                ["aarch64-linux"] = "d76c4317f7d5dba69f8a2a15856c90c777e7f0dd4e85f0de8c76de6992c374d4",
                ["aarch64-macos"] = "b67e1836c468e42e411984b56e52fa7abec08c2bd22c867398e7cc134aac5e12",
                ["x86_64-linux"] = "761c72dc8e120d85b22292063be8a796e2eeb20eb3e4f38b8fa2343ccf3514a7",
            },
            revision = 2,
        },
        ["10.5.2"] = {
            digests = {
                ["aarch64-linux"] = "63ea52cb31586e6d98efa2f06d73d542f16c7d0c4af0f07b579aaf9714cf907a",
                ["aarch64-macos"] = "81bf98a16d3d7230e4a9123fcede243d71ea31a577113476ed43f1cdf4773162",
                ["x86_64-linux"] = "7e2d07fa2b8807642aaec67b7e2972a9fbe4db26fcb340a7372392db42b26694",
            },
        },
    },
}
