return {
    name = "libgpg-error",
    description = "Error codes and common utility functions shared by the GnuPG libraries",
    homepage = "https://gnupg.org/software/libgpg-error/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/libgpg-error/",
        tag = "libgpg-error-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/libgpg-error/{tag}",
        archive = "tar.bz2",
        strip_prefix = "libgpg-error-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "rb-unpack",
                kind = "build",
            },
        },
        libraries = { "lib/libgpg-error.{shared_extension}" },
        steps = {
            configure = {
                { "/bin/sh", "./configure", "--prefix={prefix}", "--disable-nls", "--disable-doc" },
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
    outputs = {
        bins = { "gpg-error", "gpgrt-config", "yat2m" },
        checks = {
            { "gpg-error", "--version" },
            { "sh", "-c", [[gpg-error 11 | grep -q GPG_ERR_BAD_PASSPHRASE]] },
            { "gpgrt-config", "--libs", "gpg-error" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.61",
        },
        ["aarch64-macos"] = {
            default_version = "1.61",
        },
        ["x86_64-linux"] = {
            default_version = "1.61",
        },
    },
    versions = {
        ["1.61"] = {
            digests = {
                ["aarch64-linux"] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93",
                ["aarch64-macos"] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93",
                ["x86_64-linux"] = "7a85413f2bc354f4f8aa832b718af122e48965e9e0eb9012ee659c13c6385c93",
            },
        },
    },
}
