return {
    name = "intermodal",
    description = "Create and inspect BitTorrent files",
    homepage = "https://github.com/casey/intermodal",
    default_license = "CC0-1.0",
    prebuilt = {
        github = "casey/intermodal",
        tag = "v{version}",
        asset = "imdl-{tag}-{target}.tar.gz",
    },
    outputs = { bins = { "imdl" }, checks = { { "imdl", "--version" }, { "imdl", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.1.16",
            upstream = { github = "casey/intermodal", repository_id = 187931998, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.1.16",
            upstream = { github = "casey/intermodal", repository_id = 187931998, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.1.16",
            upstream = { github = "casey/intermodal", repository_id = 187931998, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.1.16"] = {
            digests = {
                ["aarch64-linux"] = "5b5f8a88cc0e8d86fb791b6fb94aaa7aa40de307f6d76e87614a39e9da167ecc",
                ["aarch64-macos"] = "832a98ab4c33902195419eba5557d1c225c53aed7ef0ddb3ba1ad9aba99a34be",
                ["x86_64-linux"] = "c9e60ec12a6a32eb771cabea9de2d697e2c4bded482240f9955f74e4b96a11c1",
            },
            revision = 2,
        },
    },
}
