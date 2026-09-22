return {
    name = "tealdeer",
    aliases = { "tldr" },
    description = "Read concise command-line usage examples",
    homepage = "https://docs.tealdeer.org",
    default_license = "Apache-2.0",
    prebuilt = { github = "tealdeer-rs/tealdeer", tag = "v{version}", asset = "tealdeer-{target}" },
    outputs = { bins = { "tldr" }, checks = { { "tldr", "--version" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64-musl",
            default_version = "1.9.0",
            upstream = {
                github = "tealdeer-rs/tealdeer",
                repository_id = 48739367,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "1.9.0",
            upstream = {
                github = "tealdeer-rs/tealdeer",
                repository_id = 48739367,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64-musl",
            default_version = "1.9.0",
            upstream = {
                github = "tealdeer-rs/tealdeer",
                repository_id = 48739367,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["1.9.0"] = {
            digests = {
                ["aarch64-linux"] = "a748f181c00933980cb850f4a24199c45900fc523787f6c524232a6bfc66b895",
                ["aarch64-macos"] = "e6c6d9bf6d0267a38d5709c2b8334467fedd456927429ab426ff823201c13a40",
                ["x86_64-linux"] = "dc7263b550e90c0689ea2cb434e3144469805d5dddecbb1f7fc534e1185b7408",
            },
            revision = 2,
        },
    },
}
