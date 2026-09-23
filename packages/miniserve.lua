return {
    name = "miniserve",
    description = "Serve a directory over HTTP",
    homepage = "https://github.com/svenstaro/miniserve",
    default_license = "MIT",
    upstream = {
        github = "svenstaro/miniserve",
        repository_id = 131135585,
        tag = "v{version}",
    },
    prebuilt = {
        github = "svenstaro/miniserve",
        tag = "v{version}",
        asset = "miniserve-{version}-{target}",
    },
    outputs = {
        bins = { "miniserve" },
        checks = {
            { "miniserve", "--version" },
            { "miniserve", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.35.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.35.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.35.0",
        },
    },
    versions = {
        ["0.35.0"] = {
            digests = {
                ["aarch64-linux"] = "732b1d5b30a3903580cee9ca24b2ff04ba2a5c78fa1ba6579dc5154fc431b40a",
                ["aarch64-macos"] = "8e8dc916b1dc3bc2a46bf5a44308caf7db153e6940db178668929e1de40d1fbb",
                ["x86_64-linux"] = "c630ee030d5d9d83c88c5cc72f43ae215b0c214d64fd7afc92244fe369af2964",
            },
            revision = 2,
        },
    },
}
