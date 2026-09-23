return {
    name = "openssl",
    description = "TLS and cryptography libraries and tools",
    homepage = "https://openssl-library.org/",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/openssl/openssl/releases/download/openssl-4.0.2/openssl-4.0.2.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openssl-4.0.2",
    },
    build = {
        backend = "custom",
        libraries = { "lib/libssl.a", "lib/libcrypto.a" },
        steps = {
            configure = {
                {
                    "perl",
                    "./Configure",
                    "--prefix=/",
                    "--libdir=lib",
                    "--openssldir=/etc/ssl",
                    "no-shared",
                    "no-module",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                { "/usr/bin/env", "HARNESS_JOBS={jobs}", "make", "test" },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install_sw" },
            },
        },
    },
    outputs = {
        bins = { "openssl" },
        checks = {
            { "openssl", "version", "-a" },
            { "openssl", "list", "-providers", "-provider", "default", "-provider", "legacy" },
            { "openssl", "dgst", "-sha256" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "4.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "4.0.2",
        },
    },
    versions = {
        ["4.0.2"] = {
            digests = {
                ["aarch64-linux"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
                ["aarch64-macos"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
                ["x86_64-linux"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
            },
        },
    },
}
