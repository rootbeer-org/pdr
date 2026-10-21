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
            default_version = "0.47.0",
            prebuilt = {
                github = "sigoden/dufs",
                tag = "v{version}",
                asset = "dufs-{tag}-{target}.tar.gz",
            },
        },
        ["aarch64-macos"] = {
            default_version = "0.47.0",
            source = {
                url = "https://codeload.github.com/sigoden/dufs/tar.gz/refs/tags/{tag}",
                archive = "tar.gz",
                strip_prefix = "dufs-{version}",
            },
            build = {
                backend = "rust",
                dependencies = {
                    { package = "rust", kind = "build" },
                },
                rust = {
                    packages = { "dufs" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.47.0",
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
        ["0.47.0"] = {
            digests = {
                ["aarch64-linux"] = "faf1c961ad47c5d636b14956b6279e1278453517cd5d3c274d21d522b495800a",
                ["aarch64-macos"] = "bab9d4fa1654adc6c88523b61bb8697f575334248cf554282e1f87e2329c0569",
                ["x86_64-linux"] = "c715c44b195f6133ca0f47e6fdc8d6015ec64b7fd9ac8e1c578ca23a92206aa4",
            },
        },
    },
}
