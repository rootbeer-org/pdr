return {
    name = "lsd",
    description = "List directory contents with colors and icons",
    homepage = "https://github.com/lsd-rs/lsd",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "lsd-rs/lsd",
        repository_id = 158927812,
        tag = "v{version}",
    },
    prebuilt = {
        github = "lsd-rs/lsd",
        tag = "v{version}",
        asset = "lsd-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "lsd" },
        checks = {
            { "lsd", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.2.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.2.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.2.0",
        },
    },
    versions = {
        ["1.2.0"] = {
            digests = {
                ["aarch64-linux"] = "642ecb1a763b9f790a99c83a1445c117a6813ed4edb5d498d4420423c6353eb8",
                ["aarch64-macos"] = "9e34a5d392ff913302098aad0543dafa1883c531eaf229b82f086c3fca675e3e",
                ["x86_64-linux"] = "77849da1210336534258551a581401ba19ae6b8d7b66a2a1feff148ad41e3814",
            },
            revision = 2,
        },
    },
}
