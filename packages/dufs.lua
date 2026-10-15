return {
    name = "dufs",
    description = "Serve and share files over HTTP",
    homepage = "https://github.com/sigoden/dufs",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "sigoden/dufs",
        repository_id = 496605552,
        tag = "v{version}",
    },
    outputs = {
        bins = { "dufs" },
        checks = {
            { "dufs", "--version" },
            { "dufs", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.46.0",
            prebuilt = {
                github = "sigoden/dufs",
                tag = "v{version}",
                asset = "dufs-{tag}-{target}.tar.gz",
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.46.0",
            source = {
                url = "https://codeload.github.com/sigoden/dufs/tar.gz/refs/tags/{tag}",
                archive = "tar.gz",
                strip_prefix = "dufs-{version}",
            },
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", version = "1.98.1", kind = "build" },
                },
                rust = {
                    packages = { "dufs" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.46.0",
            prebuilt = {
                github = "sigoden/dufs",
                tag = "v{version}",
                asset = "dufs-{tag}-{target}.tar.gz",
            },
        },
    },
    versions = {
        ["0.46.0"] = {
            digests = {
                ["aarch64-linux"] = "1472123ae3aa07e49404d16b20305c2dec90c59883ebda9308717f7205e6511b",
                ["aarch64-macos"] = "e5bb926107736802bfd3be6937482dd3daf396a5c481fed714de542055286ebc",
                ["x86_64-linux"] = "817769f726613194bcff9d0e3e481eaccc86ac11208857614f36a8c02f410977",
            },
            revision = 2,
        },
    },
}
