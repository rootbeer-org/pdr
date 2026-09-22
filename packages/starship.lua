return {
    name = "starship",
    description = "Configure shell prompts",
    homepage = "https://starship.rs",
    default_license = "ISC",
    prebuilt = {
        github = "starship/starship",
        tag = "v{version}",
        asset = "starship-{target}.tar.gz",
    },
    outputs = {
        bins = { "starship" },
        checks = { { "starship", "--version" }, { "starship", "init", "zsh" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.26.0",
            upstream = { github = "starship/starship", repository_id = 178991158, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.26.0",
            upstream = { github = "starship/starship", repository_id = 178991158, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.26.0",
            upstream = { github = "starship/starship", repository_id = 178991158, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.26.0"] = {
            digests = {
                ["aarch64-linux"] = "dc30189378d2f2e287384e8a692d3f95ad1df64cf0e8c36aa9201516028aed6b",
                ["aarch64-macos"] = "c40b27b11f580411e068f2fa6c1be7830a387c0bc47a94d1d37f32b054c5361d",
                ["x86_64-linux"] = "b7c232b0e8249d8e55a40beb79c5c43a7d370f3f9408bd215deb0170daeaadf3",
            },
            revision = 2,
        },
    },
}
