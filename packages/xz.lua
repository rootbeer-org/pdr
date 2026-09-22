return {
    name = "xz",
    description = "Compress and decompress XZ streams",
    homepage = "https://tukaani.org/xz/",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/tukaani-project/xz/releases/download/v{version}/xz-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "xz-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-nls",
            "--disable-scripts",
            "--disable-doc",
        },
        libraries = { "lib/liblzma.a" },
    },
    outputs = {
        bins = { "xz", "xzdec", "lzmadec", "lzmainfo" },
        checks = {
            { "xz", "--version" },
            { "xzdec", "--version" },
            { "lzmadec", "--version" },
            { "lzmainfo", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = { default_version = "5.8.3" },
        ["aarch64-macos"] = { default_version = "5.8.3" },
        ["x86_64-linux"] = { default_version = "5.8.3" },
    },
    versions = {
        ["5.8.3"] = {
            digests = {
                ["aarch64-linux"] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0",
                ["aarch64-macos"] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0",
                ["x86_64-linux"] = "3d3a1b973af218114f4f889bbaa2f4c037deaae0c8e815eec381c3d546b974a0",
            },
            revision = 3,
        },
    },
}
