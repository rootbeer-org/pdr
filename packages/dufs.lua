return {
    name = "dufs",
    description = "Serve and share files over HTTP",
    homepage = "https://github.com/sigoden/dufs",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "sigoden/dufs",
        repository_id = 496605552,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sigoden/dufs",
        tag = "v{version}",
        asset = "dufs-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "dufs" },
        checks = {
            { "dufs", "--version" },
            { "dufs", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.47.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.47.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.47.0",
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
        ["0.47.0"] = {
            digests = {
                ["aarch64-linux"] = "faf1c961ad47c5d636b14956b6279e1278453517cd5d3c274d21d522b495800a",
                ["aarch64-macos"] = "8a9dd5f67f1d32e5808ca3cf1b5499322cd48d2cc82562b1984b49ebaef331ee",
                ["x86_64-linux"] = "c715c44b195f6133ca0f47e6fdc8d6015ec64b7fd9ac8e1c578ca23a92206aa4",
            },
        },
    },
}
