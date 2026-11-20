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
            default_version = "0.21.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.21.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.21.2",
        },
    },
    versions = {
        ["0.21.1"] = {
            digests = {
                ["aarch64-linux"] = "efe38626967f550c1d3bbe2014990dff5c8028a0a65a3f9b9b6c4a3bb53bfa28",
                ["aarch64-macos"] = "410442570af59c7d8d7f1303abfdc41ba8abc7527a1be697fd03546edeaba9d6",
                ["x86_64-linux"] = "5cdb719bf6f7c7503ef8bcf181a31577eeca58a8167234f0955f48dd4a92e989",
            },
        },
        ["0.21.2"] = {
            digests = {
                ["aarch64-linux"] = "36dca3ddb293d2fa635aa2bf9c53c0ba2d38dcd749290d81c6685974cf3799c4",
                ["aarch64-macos"] = "ac78b8953c5087852437bfa0abfcc7908db1f7a7b7ab0e39e114a9454bb335a4",
                ["x86_64-linux"] = "d4c55c9b9991c308cad84412e8a8afdc990779e4dd021f6ebb277a4249719b9f",
            },
        },
    },
}
