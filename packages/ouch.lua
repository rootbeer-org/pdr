return {
    name = "ouch",
    description = "Compress and extract archives",
    homepage = "https://github.com/ouch-org/ouch",
    default_license = "NOASSERTION",
    prebuilt = { github = "ouch-org/ouch", tag = "{version}", asset = "ouch-{target}.tar.gz" },
    outputs = { bins = { "ouch" }, checks = { { "ouch", "--version" }, { "ouch", "--help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.8.3",
            upstream = { github = "ouch-org/ouch", repository_id = 349334268, tag_prefix = "" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.8.3",
            upstream = { github = "ouch-org/ouch", repository_id = 349334268, tag_prefix = "" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.8.3",
            upstream = { github = "ouch-org/ouch", repository_id = 349334268, tag_prefix = "" },
        },
    },
    versions = {
        ["0.8.3"] = {
            digests = {
                ["aarch64-linux"] = "4619158de69e65e8d23147c3d8b46b116feb0259c8a1704df7d792394c2b5847",
                ["aarch64-macos"] = "969c1bd9105b5033cc9cac0a37c011d23482948d681b43f97c6f79311f3263d0",
                ["x86_64-linux"] = "eaab9b997a823f584557ac5f85205105ae577a4c4fbd23926b686469cfa19881",
            },
            revision = 2,
        },
    },
}
