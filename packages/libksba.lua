return {
    name = "libksba",
    description = "X.509 and CMS library used by GnuPG",
    homepage = "https://gnupg.org/software/libksba/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later OR GPL-2.0-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/libksba/",
        tag = "libksba-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/libksba/{tag}",
        archive = "tar.bz2",
        strip_prefix = "libksba-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "rb-unpack",
                kind = "build",
            },
            {
                package = "libgpg-error",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libksba.{shared_extension}" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-doc",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "make", "check" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.9.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.9.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.9.1",
        },
    },
    versions = {
        ["1.8.1"] = {
            digests = {
                ["aarch64-linux"] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5",
                ["aarch64-macos"] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5",
                ["x86_64-linux"] = "c2f84393011827219ae117131dba8e7684c2bed0961eed11b0642c2acba440b5",
            },
        },
        ["1.9.1"] = {
            digests = {
                ["aarch64-linux"] = "9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b",
                ["aarch64-macos"] = "9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b",
                ["x86_64-linux"] = "9afdd398b4a076735e1e7fd29c7f6e7670b6c382aee2d3a55aa937b283f43e5b",
            },
        },
    },
}
