return {
    name = "bat",
    description = "View files with syntax highlighting",
    homepage = "https://github.com/sharkdp/bat",
    default_license = "Apache-2.0",
    prebuilt = { github = "sharkdp/bat", tag = "v{version}", asset = "bat-{tag}-{target}.tar.gz" },
    outputs = {
        bins = { "bat" },
        checks = { { "bat", "--version" }, { "bat", "--list-languages" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.26.1",
            upstream = { github = "sharkdp/bat", repository_id = 130464961, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.26.1",
            upstream = { github = "sharkdp/bat", repository_id = 130464961, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.26.1",
            upstream = { github = "sharkdp/bat", repository_id = 130464961, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.26.1"] = {
            digests = {
                ["aarch64-linux"] = "6369242c584065f195fb20cb36fbd7cb63ae690605bbe89868a7596b596c2c23",
                ["aarch64-macos"] = "e30beff26779c9bf60bb541e1d79046250cb74378f2757f8eb250afddb19e114",
                ["x86_64-linux"] = "0dcd8ac79732c0d5b136f11f4ee00e581440e16a44eab5b3105b611bbf2cf191",
            },
            revision = 2,
        },
    },
}
