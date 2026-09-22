return {
    name = "dufs",
    description = "Serve and share files over HTTP",
    homepage = "https://github.com/sigoden/dufs",
    default_license = "Apache-2.0",
    prebuilt = { github = "sigoden/dufs", tag = "v{version}", asset = "dufs-{tag}-{target}.tar.gz" },
    outputs = { bins = { "dufs" }, checks = { { "dufs", "--version" }, { "dufs", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.46.0",
            upstream = { github = "sigoden/dufs", repository_id = 496605552, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.46.0",
            upstream = { github = "sigoden/dufs", repository_id = 496605552, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.46.0",
            upstream = { github = "sigoden/dufs", repository_id = 496605552, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.46.0"] = {
            digests = {
                ["aarch64-linux"] = "1472123ae3aa07e49404d16b20305c2dec90c59883ebda9308717f7205e6511b",
                ["aarch64-macos"] = "2c73fa330447c344111aea9159621af5e2d4460b9227562e09138e5c01d3becf",
                ["x86_64-linux"] = "817769f726613194bcff9d0e3e481eaccc86ac11208857614f36a8c02f410977",
            },
            revision = 2,
        },
    },
}
