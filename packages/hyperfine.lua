return {
    name = "hyperfine",
    description = "Benchmark command execution",
    homepage = "https://github.com/sharkdp/hyperfine",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "sharkdp/hyperfine",
        repository_id = 117356231,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sharkdp/hyperfine",
        tag = "v{version}",
        asset = "hyperfine-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "hyperfine" },
        checks = {
            { "hyperfine", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "1.20.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.20.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.20.0",
        },
    },
    versions = {
        ["1.20.0"] = {
            digests = {
                ["aarch64-linux"] = "90875cb1db7a1d797c311174d061728361e58fc70e3b62262a00635ac3b1997c",
                ["aarch64-macos"] = "8ee7067016620447c9d2d6234ec9a4680f958b7ad983549b56334668f63075b5",
                ["x86_64-linux"] = "3285ec7959285288137043dd81dce0dde056227018a8277532d9a364b4f03c2b",
            },
            revision = 2,
        },
    },
}
