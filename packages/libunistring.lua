return {
    name = "libunistring",
    description = "Unicode string processing library",
    homepage = "https://www.gnu.org/software/libunistring/",
    default_license = "NOASSERTION",
    source = {
        url = "https://ftp.gnu.org/gnu/libunistring/libunistring-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libunistring-{version}",
    },
    build = {
        backend = "autotools",
        configure = {
            "--disable-shared",
            "--enable-static",
            "--disable-rpath",
            "--without-libiconv-prefix",
        },
        dependencies = { "libiconv@1.19" },
        libraries = { "lib/libunistring.a" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.2",
        },
    },
    versions = {
        ["1.4.2"] = {
            digests = {
                ["aarch64-linux"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
                ["aarch64-macos"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
                ["x86_64-linux"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
            },
        },
    },
}
