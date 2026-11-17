return {
    name = "opus",
    description = "Low-latency lossy audio codec",
    homepage = "https://opus-codec.org/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "xiph/opus",
        repository_id = 23097173,
        tag = "v{version}",
    },
    source = {
        url = "https://downloads.xiph.org/releases/opus/opus-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "opus-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--enable-shared",
            "--enable-static",
            "--with-pic",
            "--disable-doc",
            "--disable-extra-programs",
        },
        libraries = { "lib/libopus.a", "lib/libopus.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.6.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.6.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.6.1",
        },
    },
    versions = {
        ["1.6.1"] = {
            digests = {
                ["aarch64-linux"] = "6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1",
                ["aarch64-macos"] = "6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1",
                ["x86_64-linux"] = "6ffcb593207be92584df15b32466ed64bbec99109f007c82205f0194572411a1",
            },
        },
    },
}
