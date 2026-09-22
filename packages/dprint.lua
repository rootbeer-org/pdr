return {
    name = "dprint",
    description = "Format source files with configurable plugins",
    homepage = "https://github.com/dprint/dprint",
    default_license = "MIT",
    prebuilt = { github = "dprint/dprint", tag = "{version}", asset = "dprint-{target}.zip" },
    outputs = { bins = { "dprint" }, checks = { { "dprint", "--version" }, { "dprint", "help" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.57.4",
            upstream = { github = "dprint/dprint", repository_id = 192136193, tag_prefix = "" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.57.4",
            upstream = { github = "dprint/dprint", repository_id = 192136193, tag_prefix = "" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.57.4",
            upstream = { github = "dprint/dprint", repository_id = 192136193, tag_prefix = "" },
        },
    },
    versions = {
        ["0.57.4"] = {
            digests = {
                ["aarch64-linux"] = "e1b713806f7f7b94072ba2b069aa19ac28f475dbb1fbc5b672d3030a2ab001ee",
                ["aarch64-macos"] = "f9e752812791f258e89ff88a7affd05c793b0db3d929718651eae7df5f19eb2e",
                ["x86_64-linux"] = "03f3e8002f9d952bf53325fc8853686d2e8808b9e5b652b215600ba147e73a5c",
            },
            revision = 2,
        },
    },
}
