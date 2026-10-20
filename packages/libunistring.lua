return {
    name = "libunistring",
    description = "Unicode string processing library",
    homepage = "https://www.gnu.org/software/libunistring/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later OR GPL-2.0-or-later",
    upstream = {
        git = "https://https.git.savannah.gnu.org/git/libunistring.git",
        tag = "v{version}",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/libunistring/libunistring-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libunistring-{version}",
    },
    build = {
        backend = "autotools",
        -- gnulib's lock tests use POSIX named semaphores.
        allow = { "ipc" },
        configure = {
            "--enable-shared",
            "--enable-static",
            "--disable-rpath",
            "--without-libiconv-prefix",
        },
        dependencies = {
            {
                package = "libiconv",
                version = "1.19",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libunistring.a", "lib/libunistring.{shared_extension}" },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.5",
        },
        ["aarch64-macos"] = {
            default_version = "1.5",
        },
        ["x86_64-linux"] = {
            default_version = "1.5",
        },
    },
    versions = {
        ["1.4.2"] = {
            digests = {
                ["aarch64-linux"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
                ["aarch64-macos"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
                ["x86_64-linux"] = "e82664b170064e62331962126b259d452d53b227bb4a93ab20040d846fec01d8",
            },
            revision = 2,
        },
        ["1.5"] = {
            digests = {
                ["aarch64-linux"] = "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af407ae3383c9d81",
                ["aarch64-macos"] = "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af407ae3383c9d81",
                ["x86_64-linux"] = "5b0ecd46cbf225375f20ab4056197e66a7ac590e2684c069af407ae3383c9d81",
            },
        },
    },
}
