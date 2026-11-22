return {
    name = "gnupg",
    description = "Encrypt and sign data with OpenPGP",
    homepage = "https://gnupg.org",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-or-later",
    upstream = {
        listing = "https://www.gnupg.org/ftp/gcrypt/gnupg/",
        tag = "gnupg-{version}.tar.bz2",
    },
    source = {
        url = "https://www.gnupg.org/ftp/gcrypt/gnupg/{tag}",
        archive = "tar.bz2",
        strip_prefix = "gnupg-{version}",
    },
    build = {
        backend = "custom",
        -- The tests start agents on unix sockets, and the gpgscm harness makes its scratch
        -- directories in a hard-coded /tmp.
        allow = { "local-network", "tmp" },
        dependencies = {
            {
                package = "rb-unpack",
                kind = "build",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "libgpg-error",
                kind = "link_runtime",
            },
            {
                package = "libgcrypt",
                kind = "link_runtime",
            },
            {
                package = "libassuan",
                kind = "link_runtime",
            },
            {
                package = "libksba",
                kind = "link_runtime",
            },
            {
                package = "npth",
                kind = "link_runtime",
            },
            {
                package = "gnutls",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
            {
                package = "bzip2",
                kind = "link_runtime",
            },
            {
                package = "readline",
                kind = "link_runtime",
            },
            {
                package = "sqlite",
                kind = "link_runtime",
            },
            {
                package = "pinentry",
                kind = "runtime",
            },
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./configure",
                    "--prefix={prefix}",
                    "--disable-doc",
                    "--disable-nls",
                    "--disable-ldap",
                    -- Smartcard access through the built-in CCID driver needs libusb.
                    "--disable-ccid-driver",
                    "--with-pinentry-pgm={dependencies.pinentry}/bin/pinentry",
                    "--with-zlib={dependencies.zlib}",
                    "--with-bzip2={dependencies.bzip2}",
                    "--with-readline={dependencies.readline}",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                -- gpg-agent does not come up inside the macOS sandbox ("IPC connect call failed"), so
                -- only the unit tests run there.
                {
                    "sh",
                    "-c",
                    [[if [ "$(uname)" = Darwin ]; then exec make check tests=; fi; exec make check]],
                },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = {
            "gpg",
            "gpgv",
            "gpgsm",
            "gpgconf",
            "gpgtar",
            "gpg-agent",
            "gpg-connect-agent",
            "dirmngr",
        },
        checks = {
            { "gpg", "--version" },
            { "dirmngr", "--version" },
            {
                "sh",
                "-c",
                [[expected="BA7816BF 8F01CFEA 414140DE 5DAE2223 B00361A3 96177A9C B410FF61 F20015AD"
test "$(printf abc | gpg --print-md SHA256)" = "$expected"]],
            },
            -- Checks cannot bind the agent's unix socket, so verify a signature made ahead of time
            -- with a throwaway key; the build's test suite covers signing and encryption.
            {
                "sh",
                "-c",
                [[set -eu
d=$(mktemp -d "$TMPDIR/g.XXXXXX")
trap 'rm -rf "$d"' EXIT
cd "$d"
export GNUPGHOME=$d
cat > key.asc <<'EOF'
-----BEGIN PGP PUBLIC KEY BLOCK-----

mDMEavti0RYJKwYBBAHaRw8BAQdAPjnKvyYUE2XKQid/u3zXgBiY/Wbbow/9d2Hw
HYU34ey0GHJvb3RiZWVyQGV4YW1wbGUuaW52YWxpZIivBBMWCgBXFiEE/sxwdZTY
qEmkg0x2S6ZoxlruVNgFAmr7YtEbFIAAAAAABAAObWFudTIsMi41KzEuMTIsMCwz
AhsDBQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheAAAoJEEumaMZa7lTY9eIBALht
G2qexYobUv0b8TXQlC0yJ0z2jYgsnoGmFALCw6+uAQCFAHwRBkVOSFPxlpPlJEOH
PLqBIioYkt/Cah3ZWj9uDg==
=POXX
-----END PGP PUBLIC KEY BLOCK-----
EOF
cat > msg.asc <<'EOF'
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

rootbeer gnupg check
-----BEGIN PGP SIGNATURE-----

iJEEARYKADkWIQT+zHB1lNioSaSDTHZLpmjGWu5U2AUCavti0hsUgAAAAAAEAA5t
YW51MiwyLjUrMS4xMiwwLDMACgkQS6ZoxlruVNj3LgD/X78Ms55rbaf8lJVgluJs
zfOvBot+cwYyCohkO42yK6QA/1F8UCo041rpe6X2n0IdyslNxNhdhSN9PnkbJ8SQ
jHwJ
=8l1y
-----END PGP SIGNATURE-----
EOF
gpg --dearmor < key.asc > key.gpg
gpgv --keyring ./key.gpg msg.asc
sed 's/check/chack/' msg.asc > bad.asc
! gpgv --keyring ./key.gpg bad.asc]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.5.24",
        },
        ["aarch64-macos"] = {
            default_version = "2.5.24",
        },
        ["x86_64-linux"] = {
            default_version = "2.5.24",
        },
    },
    versions = {
        ["2.5.24"] = {
            digests = {
                ["aarch64-linux"] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039",
                ["aarch64-macos"] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039",
                ["x86_64-linux"] = "bf149d01a2b9fcc0e4589b8ae8697d3d5c557ea48ed95a3fa55dd3b1187e6039",
            },
        },
    },
}
