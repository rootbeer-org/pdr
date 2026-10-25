return {
    name = "starship",
    description = "Render a customizable prompt for any shell",
    homepage = "https://starship.rs",
    recipe_maintainers = { "tale" },
    default_license = "ISC",
    upstream = {
        github = "starship/starship",
        repository_id = 178991158,
        tag = "v{version}",
    },
    prebuilt = {
        github = "starship/starship",
        tag = "v{version}",
        asset = "starship-{target}.tar.gz",
    },
    outputs = {
        bins = { "starship" },
        checks = {
            { "starship", "--version" },
            { "starship", "init", "zsh" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.27.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.27.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.27.0",
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
        ["1.27.0"] = {
            digests = {
                ["aarch64-linux"] = "341f5cbf24699fa0b27ec88965ad25f862ea09e15d35a543fd6ffdff1d2aa00d",
                ["aarch64-macos"] = "5362da8cb2928f98f3ce0ffda697cf0f8de70081db000dae316d6d3a404f6cf0",
                ["x86_64-linux"] = "10c8eb4cb3b761d9bf59ea828444c2dab36c900b7d69a69e08814b286969df89",
            },
        },
    },
}
