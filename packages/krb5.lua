return {
    name = "krb5",
    description = "MIT Kerberos network authentication libraries and tools",
    homepage = "https://web.mit.edu/kerberos/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "krb5/krb5",
        tag = "krb5-{version}-final",
    },
    -- Built from the top level so upstream commits apply as published.
    source = {
        url = "https://kerberos.org/dist/krb5/{major}.{minor}/krb5-{version}.tar.gz",
        mirrors = { "https://web.mit.edu/kerberos/dist/krb5/{major}.{minor}/krb5-{version}.tar.gz" },
        archive = "tar.gz",
        strip_prefix = "krb5-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "byacc",
                kind = "build",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "openssl",
                kind = "link_runtime",
            },
            {
                package = "keyutils",
                kind = "link",
            },
            {
                package = "libedit",
                kind = "link",
            },
            {
                package = "ncurses",
                kind = "link",
            },
            {
                package = "cmocka",
                kind = "link",
            },
        },
        libraries = {
            "lib/libkrb5.{shared_extension}",
            "lib/libk5crypto.{shared_extension}",
            "lib/libkrb5support.{shared_extension}",
            "lib/libcom_err.{shared_extension}",
            "lib/libgssapi_krb5.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "sh",
                    "src/configure",
                    "--prefix={prefix}",
                    "--sysconfdir=/etc",
                    "--localstatedir=/var",
                    "--disable-rpath",
                    "--without-system-verto",
                    "--without-ldap",
                    "--without-lmdb",
                    "--with-libedit",
                    "--with-crypto-impl=openssl",
                    -- k5tls fails against OpenSSL 4.0 on the 1.22 branch; master fixes it in
                    -- f5bbfa48 and 5e4e8452. Restore openssl once a release carries them.
                    -- Its plugins (and PKINIT and SPAKE) load from the compiled-in /lib/krb5/plugins,
                    -- which a relocated store never provides, until krb5.conf sets plugin_base_dir.
                    "--with-tls-impl=no",
                    -- Keeps hosts with and without python3 on the same test suite; the Python tests
                    -- would need a pinned interpreter.
                    "PYTHON=false",
                    -- glibc 2.34 moved the resolver into libc, and linking libresolv.so.2 would fail
                    -- the runtime audit.
                    "ac_cv_lib_resolv_main=no",
                    -- libedit is static, so its terminal library must be linked explicitly.
                    "LIBS=-lncurses",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                -- check-unix-ctxprf runs a Python test without HAVE_PYTHON, unlike the rest;
                -- upstream still has this on master.
                { "make", "check", "PYTHON=true" },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = {
            "kinit",
            "klist",
            "kdestroy",
            "kvno",
            "kpasswd",
            "kswitch",
            "ktutil",
            "kadmin",
            "krb5-config",
        },
        checks = {
            { "klist", "-V" },
            { "krb5-config", "--version" },
            { "krb5-config", "--libs", "gssapi" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.22.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.22.3",
        },
    },
    versions = {
        ["1.22.2"] = {
            digests = {
                ["aarch64-linux"] = "3243ffbc8ea4d4ac22ddc7dd2a1dc54c57874c40648b60ff97009763554eaf13",
                ["x86_64-linux"] = "3243ffbc8ea4d4ac22ddc7dd2a1dc54c57874c40648b60ff97009763554eaf13",
            },
            source = {
                url = "https://kerberos.org/dist/krb5/{major}.{minor}/krb5-{version}.tar.gz",
                mirrors = {
                    "https://web.mit.edu/kerberos/dist/krb5/{major}.{minor}/krb5-{version}.tar.gz",
                },
                archive = "tar.gz",
                strip_prefix = "krb5-{version}",
                -- Unreleased fixes from the krb5-1.22 branch, applied in order, leaving out
                -- Windows, CI, and version-only commits: 9d948795 acea6182 974a8875 2b09864f
                -- ceee5d55 (without its .github hunk) 0ee8617c 62196e2b a88a18ca 67b499d6 e4d263f9
                -- eb6c0b3a 74f3cc6a a42fb6d7 09ede2e5 71bac898 09434e58 8eab5164 5dbd6ba4 e689b5d5.
                -- Drop them with 1.22.3.
                patches = {
                    "9d948795.patch",
                    "acea6182.patch",
                    "974a8875.patch",
                    "2b09864f.patch",
                    "ceee5d55.patch",
                    "0ee8617c.patch",
                    "62196e2b.patch",
                    "a88a18ca.patch",
                    "67b499d6.patch",
                    "e4d263f9.patch",
                    "eb6c0b3a.patch",
                    "74f3cc6a.patch",
                    "a42fb6d7.patch",
                    "09ede2e5.patch",
                    "71bac898.patch",
                    "09434e58.patch",
                    "8eab5164.patch",
                    "5dbd6ba4.patch",
                    "e689b5d5.patch",
                },
            },
        },
        ["1.22.3"] = {
            digests = {
                ["aarch64-linux"] = "fe90af8441ad9fa9b064b8e53077cefb782a96f8a68276b031dc54af1789ff0b",
                ["x86_64-linux"] = "fe90af8441ad9fa9b064b8e53077cefb782a96f8a68276b031dc54af1789ff0b",
            },
        },
    },
}
