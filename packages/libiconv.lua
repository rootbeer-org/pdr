return {
    name = "libiconv",
    description = "Character set conversion library",
    homepage = "https://www.gnu.org/software/libiconv/",
    default_license = "NOASSERTION",
    source = {
        url = "https://ftp.gnu.org/gnu/libiconv/libiconv-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libiconv-{version}",
    },
    build = {
        backend = "autotools",
        configure = { "--disable-shared", "--enable-static", "--disable-rpath", "--disable-nls" },
        libraries = { "lib/libiconv.a", "lib/libcharset.a" },
    },
    outputs = {
        bins = { "iconv" },
        checks = {
            { "iconv", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.19",
        },
        ["aarch64-macos"] = {
            default_version = "1.19",
        },
        ["x86_64-linux"] = {
            default_version = "1.19",
        },
    },
    versions = {
        ["1.19"] = {
            digests = {
                ["aarch64-linux"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
                ["aarch64-macos"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
                ["x86_64-linux"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
            },
        },
    },
}
