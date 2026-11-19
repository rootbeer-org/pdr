return {
    name = "gnutls",
    description = "Secure communications library implementing TLS and DTLS",
    homepage = "https://www.gnutls.org",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-2.1-or-later",
    upstream = {
        git = "https://gitlab.com/gnutls/gnutls.git",
        tag = "{version}",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/gnutls/v{major}.{minor}/gnutls-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "gnutls-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "nettle",
                kind = "link_runtime",
            },
            {
                package = "gmp",
                kind = "link_runtime",
            },
            {
                package = "libtasn1",
                kind = "link_runtime",
            },
            {
                package = "libunistring",
                kind = "link_runtime",
            },
            {
                package = "libidn2",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "brotli",
                kind = "link",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libgnutls.a", "lib/libgnutls.{shared_extension}" },
        steps = {
            configure = {
                -- A trust store set here replaces the macOS keychain, so only Linux names one, as a
                -- directory since the bundle's file name differs between distributions.
                {
                    "sh",
                    "-c",
                    [[if [ "$(uname)" = Linux ]; then set -- "$@" --with-default-trust-store-dir=/etc/ssl/certs; fi; exec ./configure "$@"]],
                    "sh",
                    "--prefix={prefix}",
                    "--enable-static",
                    "--disable-doc",
                    "--disable-guile",
                    "--disable-nls",
                    "--disable-cxx",
                    "--disable-libdane",
                    "--without-p11-kit",
                    "--without-tpm",
                    "--without-tpm2",
                    "--with-zlib=link",
                    "--with-brotli=link",
                    "--with-zstd=link",
                    -- pkg-config is not asked for brotli's private requirement, and Linux needs libm.
                    "LIBS=-lbrotlicommon -lm",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            install = {
                { "make", "install" },
                -- The full suite needs network and IPC and its mini-dtls-fragments link fails on
                -- macOS, so build and run two handshake tests against the installed libraries.
                { "make", "-C", "tests", "mini-x509", "x509sign-verify" },
                { "tests/mini-x509" },
                { "tests/x509sign-verify" },
            },
        },
    },
    outputs = {
        bins = { "gnutls-cli", "gnutls-serv", "certtool", "psktool", "srptool", "ocsptool" },
        checks = {
            { "gnutls-cli", "--version" },
            { "certtool", "--version" },
            {
                "sh",
                "-c",
                [[set -e; d=$(mktemp -d); cd "$d"
certtool --generate-privkey --key-type ecdsa --outfile key.pem
printf 'cn = rootbeer\nca\nexpiration_days = 1\n' > t.cfg
certtool --generate-self-signed --load-privkey key.pem --template t.cfg --outfile ca.pem
certtool --verify --load-ca-certificate ca.pem --infile ca.pem]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.8.14",
        },
        ["aarch64-macos"] = {
            default_version = "3.8.14",
        },
        ["x86_64-linux"] = {
            default_version = "3.8.14",
        },
    },
    versions = {
        ["3.8.13"] = {
            digests = {
                ["aarch64-linux"] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e",
                ["aarch64-macos"] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e",
                ["x86_64-linux"] = "ffed8ec1bf09c2426d4f14aae377de4753b53e537d685e604e99a8b16ca9c97e",
            },
        },
        ["3.8.14"] = {
            digests = {
                ["aarch64-linux"] = "7e2d258071f5db9620aa7ff34259331d004f7beafa3eb18560cfaf60acfbf02a",
                ["aarch64-macos"] = "7e2d258071f5db9620aa7ff34259331d004f7beafa3eb18560cfaf60acfbf02a",
                ["x86_64-linux"] = "7e2d258071f5db9620aa7ff34259331d004f7beafa3eb18560cfaf60acfbf02a",
            },
        },
    },
}
