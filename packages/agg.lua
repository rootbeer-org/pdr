return {
    name = "agg",
    description = "Convert terminal recordings to animated GIFs",
    homepage = "https://docs.asciinema.org/manual/agg/",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        github = "asciinema/agg",
        repository_id = 519132476,
        tag = "v{version}",
    },
    prebuilt = {
        github = "asciinema/agg",
        tag = "v{version}",
        asset = "agg-{target}",
    },
    outputs = {
        bins = { "agg" },
        checks = {
            { "agg", "--version" },
            { "agg", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "1.9.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.9.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.9.0",
        },
    },
    versions = {
        ["1.9.0"] = {
            digests = {
                ["aarch64-linux"] = "2b4be407b97e00e1c313a41d154ced8fa3d02c560c8f47a0db4950a2576444c9",
                ["aarch64-macos"] = "742b2b6230529b72f310acb835e9479496000f2eabc97b0993cabe1d7fe70171",
                ["x86_64-linux"] = "ddcbf6ca044c8ac3a434dcb9ee89fb9e3be87209982b7c2adb55f782e8f0f390",
            },
            revision = 2,
        },
    },
}
