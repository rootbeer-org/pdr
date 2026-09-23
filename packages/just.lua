return {
    name = "just",
    description = "Run project commands",
    homepage = "https://just.systems",
    default_license = "CC0-1.0",
    upstream = {
        github = "casey/just",
        repository_id = 61349723,
        tag = "{version}",
    },
    prebuilt = {
        github = "casey/just",
        tag = "{version}",
        asset = "just-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "just" },
        checks = {
            { "just", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.58.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.58.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.58.0",
        },
    },
    versions = {
        ["1.58.0"] = {
            digests = {
                ["aarch64-linux"] = "748237128c4c40cbdabc65e841d05ceba13cc23a91eaba395495894c1d9764df",
                ["aarch64-macos"] = "50ae3e996c974a0bf32ea7d10f495070df33f1b43e0616b2769e3d4821ed8f48",
                ["x86_64-linux"] = "4a5cc2f53e6f0f8c59092a6cc38291eb729d46a7dd95d3ae582008881b84931d",
            },
            revision = 2,
        },
    },
}
