return {
    name = "nettle",
    description = "Low-level cryptographic library",
    homepage = "https://www.lysator.liu.se/~nisse/nettle/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later OR GPL-2.0-or-later",
    upstream = {
        listing = "https://ftp.gnu.org/gnu/nettle/",
        tag = "nettle-{version}.tar.gz",
    },
    source = {
        url = "https://ftp.gnu.org/gnu/nettle/nettle-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "nettle-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "m4",
                kind = "build",
            },
            {
                package = "gmp",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libnettle.a",
            "lib/libnettle.{shared_extension}",
            "lib/libhogweed.a",
            "lib/libhogweed.{shared_extension}",
        },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}", "--disable-documentation" },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
                -- macOS test binaries load the libraries by their installed path, so check runs after.
                { "make", "-j{jobs}", "check" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.0",
        },
    },
    versions = {
        ["4.0"] = {
            digests = {
                ["aarch64-linux"] = "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094",
                ["aarch64-macos"] = "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094",
                ["x86_64-linux"] = "3addbc00da01846b232fb3bc453538ea5468da43033f21bb345cb1e9073f5094",
            },
        },
    },
}
