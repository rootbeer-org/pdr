return {
    schema = 2,
    name = "libunistring",
    description = "Unicode string processing library",
    default_version = "1.4.2",
    homepage = "https://www.gnu.org/software/libunistring/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "autotools",
        dependencies = { "libiconv@1.19" },
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-rpath",
            "--without-libiconv-prefix",
        },
    },
    inputs = {
        source = {
            url = "https://ftp.gnu.org/gnu/libunistring/libunistring-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "libunistring-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libunistring.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["1.4.2"] = {
            inputs = {
                source = {
                    sha256 = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
                },
            },
        },
    },
}
