return {
    name = "libiconv",
    description = "Character set conversion library",
    homepage = "https://www.gnu.org/software/libiconv/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later AND GPL-3.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/libiconv.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/libiconv/libiconv-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libiconv-{version}",
    },
    build = {
        backend = "autotools",
        configure = { "--enable-shared", "--enable-static", "--disable-rpath", "--disable-nls" },
        libraries = {
            "lib/libiconv.a",
            "lib/libcharset.a",
            "lib/libiconv.{shared_extension}",
            "lib/libcharset.{shared_extension}",
        },
    },
    outputs = {
        bins = { "iconv" },
        checks = {
            { "iconv", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.19.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.19.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.19.1",
        },
    },
    versions = {
        ["1.19"] = {
            digests = {
                ["aarch64-linux"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
                ["aarch64-macos"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
                ["x86_64-linux"] = "88dd96a8c0464eca144fc791ae60cd31cd8ee78321e67397e25fc095c4a19aa6",
            },
            revision = 2,
        },
        ["1.19.1"] = {
            digests = {
                ["aarch64-linux"] = "9a06844846d664d7122161700c10a64480d7c7bcead3091925a785b38c91edab",
                ["aarch64-macos"] = "9a06844846d664d7122161700c10a64480d7c7bcead3091925a785b38c91edab",
                ["x86_64-linux"] = "9a06844846d664d7122161700c10a64480d7c7bcead3091925a785b38c91edab",
            },
        },
    },
}
