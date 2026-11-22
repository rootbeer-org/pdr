return {
    name = "libgcrypt",
    description = "General purpose cryptography library based on GnuPG's code",
    homepage = "https://gnupg.org/software/libgcrypt/",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/libgcrypt/",
        tag = "libgcrypt-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/libgcrypt/{tag}",
        archive = "tar.bz2",
        strip_prefix = "libgcrypt-{version}",
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
        libraries = { "lib/libgcrypt.{shared_extension}" },
        steps = {
            configure = {
                -- Apple's assembler rejects the arm64 mpi assembly ("Unfinished frame"), so macOS uses
                -- the C fallback.
                {
                    "sh",
                    "-c",
                    [[if [ "$(uname)" = Darwin ]; then set -- "$@" --disable-asm; fi; exec ./configure "$@"]],
                    "sh",
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
    outputs = {
        bins = { "dumpsexp", "hmac256", "mpicalc" },
        checks = {
            { "dumpsexp", "--version" },
            -- HMAC-SHA256 of "abc" under the key "key" (RFC 4231 style known answer).
            {
                "sh",
                "-c",
                [[expected=9c196e32dc0175f86f4b1cb89289d6619de6bee699e4c378e68309ed97a1a6ab
printf abc | hmac256 key | grep -q "$expected"]],
            },
            -- mpicalc prints hexadecimal, so 6 * 7 is 2A.
            { "sh", "-c", [[echo '6 7 * p' | mpicalc | grep -qx 2A]] },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.12.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.12.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.12.4",
        },
    },
    versions = {
        ["1.12.4"] = {
            digests = {
                ["aarch64-linux"] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e",
                ["aarch64-macos"] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e",
                ["x86_64-linux"] = "d77f68f48879510e79a2f65977ccc68981781ea0923e5bdffac2a193ea3d660e",
            },
        },
    },
}
