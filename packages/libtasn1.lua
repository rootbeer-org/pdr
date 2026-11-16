return {
    name = "libtasn1",
    description = "ASN.1 structure parsing library",
    homepage = "https://www.gnu.org/software/libtasn1/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        git = "https://git.savannah.gnu.org/git/libtasn1.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/libtasn1/libtasn1-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libtasn1-{version}",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libtasn1.a", "lib/libtasn1.{shared_extension}" },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}", "--disable-doc" },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "-j{jobs}", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "asn1Parser", "asn1Coding", "asn1Decoding" },
        checks = {
            { "asn1Parser", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.21.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.21.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.21.0",
        },
    },
    versions = {
        ["4.21.0"] = {
            digests = {
                ["aarch64-linux"] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87",
                ["aarch64-macos"] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87",
                ["x86_64-linux"] = "1d8a444a223cc5464240777346e125de51d8e6abf0b8bac742ac84609167dc87",
            },
        },
    },
}
