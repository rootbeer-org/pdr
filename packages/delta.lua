return {
    name = "delta",
    aliases = { "git-delta" },
    description = "View git and diff output with syntax highlighting",
    homepage = "https://dandavison.github.io/delta/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dandavison/delta",
        repository_id = 193526915,
        tag = "{version}",
    },
    prebuilt = {
        github = "dandavison/delta",
        tag = "{version}",
        asset = "delta-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "delta" },
        checks = {
            { "delta", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.21.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.21.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.21.1",
        },
    },
    versions = {
        ["0.20.1"] = {
            digests = {
                ["aarch64-linux"] = "da7f4338f593572ff426ae153e0870e2fdc72729416eff551b40cdeb67940db8",
                ["aarch64-macos"] = "bc1839cea69288d4673a24faffbb825d408ca907e0f7d33b1678c9e6cdd5e58e",
                ["x86_64-linux"] = "69dcb4043f55c29118f408c6efd30115e0a4e0a6709253343b8c8fa814ab4a31",
            },
        },
        ["0.21.1"] = {
            digests = {
                ["aarch64-linux"] = "efe38626967f550c1d3bbe2014990dff5c8028a0a65a3f9b9b6c4a3bb53bfa28",
                ["aarch64-macos"] = "410442570af59c7d8d7f1303abfdc41ba8abc7527a1be697fd03546edeaba9d6",
                ["x86_64-linux"] = "5cdb719bf6f7c7503ef8bcf181a31577eeca58a8167234f0955f48dd4a92e989",
            },
        },
    },
}
