return {
    name = "xxhash",
    description = "Fast non-cryptographic hashing library and checksum tool",
    homepage = "https://xxhash.com/",
    default_license = "NOASSERTION",
    upstream = {
        github = "Cyan4973/xxHash",
        repository_id = 19330466,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/Cyan4973/xxHash/archive/refs/tags/v{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "xxHash-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libxxhash.a" },
        steps = {
            build = {
                { "make", "-j{jobs}", "libxxhash.a", "xxhsum" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                {
                    "make",
                    "PREFIX=/",
                    "DESTDIR={prefix}",
                    "install_libxxhash.a",
                    "install_libxxhash.includes",
                    "install_libxxhash.pc",
                    "install_xxhsum",
                    "install_man",
                },
            },
        },
    },
    outputs = {
        bins = { "xxhsum" },
        checks = {
            { "xxhsum", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.8.4",
        },
        ["aarch64-macos"] = {
            default_version = "0.8.4",
        },
        ["x86_64-linux"] = {
            default_version = "0.8.4",
        },
    },
    versions = {
        ["0.8.3"] = {
            digests = {
                ["aarch64-linux"] = "aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80",
                ["aarch64-macos"] = "aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80",
                ["x86_64-linux"] = "aae608dfe8213dfd05d909a57718ef82f30722c392344583d3f39050c7f29a80",
            },
        },
        ["0.8.4"] = {
            digests = {
                ["aarch64-linux"] = "5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32",
                ["aarch64-macos"] = "5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32",
                ["x86_64-linux"] = "5738270935e7c3d38a79b3adf7c9692566ce7895a25f67de43ad52ab504acd32",
            },
        },
    },
}
