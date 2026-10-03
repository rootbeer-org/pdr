return {
    name = "dprint",
    description = "Format source files with configurable plugins",
    homepage = "https://dprint.dev/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dprint/dprint",
        repository_id = 192136193,
        tag = "{version}",
    },
    prebuilt = {
        github = "dprint/dprint",
        tag = "{version}",
        asset = "dprint-{target}.zip",
    },
    outputs = {
        bins = { "dprint" },
        checks = {
            { "dprint", "--version" },
            { "dprint", "help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.59.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.59.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.59.0",
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
        ["0.58.0"] = {
            digests = {
                ["aarch64-linux"] = "c74dd4f48dd9b8d6d595acfb238dd32ede67bdf792e8c6e2b8760cdaff9d80fb",
                ["aarch64-macos"] = "06a7ea017e4d7da296f8a44fabb2f3d6ffafa91bbd5fddd4830bdc418bacb46d",
                ["x86_64-linux"] = "06c2a239a1214d5f9e76c364cadbd0ffaee710fdb516ca6448b08860364db6e2",
            },
        },
        ["0.59.0"] = {
            digests = {
                ["aarch64-linux"] = "b90a0e7ede5fbae3e9f4e0e50455902a7e436f575c8db3b9b7fea9b7a0303210",
                ["aarch64-macos"] = "1888b152b3541c3690ec5291dd58bde7116e6c8beb4aa1f242187f22071df22f",
                ["x86_64-linux"] = "c1e709d629caf8c1f8ef8328f2b5136c68dd5e878b36b04403bf9dfd133c559f",
            },
        },
    },
}
