return {
    name = "just",
    description = "Run project commands",
    homepage = "https://just.systems",
    recipe_maintainers = { "tale" },
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
            default_version = "1.59.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.59.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.59.0",
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
        ["1.59.0"] = {
            digests = {
                ["aarch64-linux"] = "23871b1702bfd550fb5f901778fd4290ecf2ee034a45a889fbe96d89b188086d",
                ["aarch64-macos"] = "6574cea774ed4cae12e24b6aa11857de33e80dab4667cf628fd5840df96a2a9d",
                ["x86_64-linux"] = "409044617b6f06517c1035e55ca38c8c856ff8b650e41bc2aa1ef82d5903a23e",
            },
        },
    },
}
