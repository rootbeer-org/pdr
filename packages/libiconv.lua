return {
    schema = 2,
    name = "libiconv",
    description = "Character set conversion library",
    default_version = "1.19",
    homepage = "https://www.gnu.org/software/libiconv/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        configure = { "--disable-shared", "--enable-static", "--disable-rpath", "--disable-nls" },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/libiconv/libiconv-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "libiconv-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libiconv.a", "lib/libcharset.a" },
        bins = { "iconv" },
        checks = { { "iconv", "--version" } },
    },
    versions = {
        ["1.19"] = {
            inputs = {
                source = {
                    sha256 = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
                },
            },
        },
    },
}
