return {
    name = "openssl",
    description = "TLS and cryptography libraries and tools",
    homepage = "https://openssl-library.org/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "openssl/openssl",
        repository_id = 7634677,
        tag = "openssl-{version}",
    },
    source = {
        url = "https://github.com/openssl/openssl/releases/download/openssl-{version}/openssl-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openssl-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "perl",
                version = "5.44.0",
                kind = "all",
            },
        },
        libraries = {
            "lib/libssl.a",
            "lib/libcrypto.a",
            "lib/libssl.{shared_extension}",
            "lib/libcrypto.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "perl",
                    "./Configure",
                    "--prefix={prefix}",
                    "--libdir=lib",
                    "--openssldir=/etc/ssl",
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
                { "make", "install_sw" },
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
            default_version = "4.0.3",
        },
        ["aarch64-macos"] = {
            default_version = "4.0.3",
            build = {
                backend = "custom",
                -- TLS, QUIC, and HTTP tests run servers on loopback.
                allow = { "local-network" },
                dependencies = {
                    {
                        package = "perl",
                        version = "5.44.0",
                        kind = "all",
                    },
                },
                libraries = {
                    "lib/libssl.a",
                    "lib/libcrypto.a",
                    "lib/libssl.{shared_extension}",
                    "lib/libcrypto.{shared_extension}",
                },
                steps = {
                    configure = {
                        {
                            "perl",
                            "./Configure",
                            "--prefix={prefix}",
                            "--libdir=lib",
                            "--openssldir=/etc/ssl",
                            "no-module",
                        },
                    },
                    build = {
                        { "make", "-j{jobs}" },
                    },
                    check = {
                        { "/usr/bin/env", "HARNESS_JOBS={jobs}", "make", "test", "TESTS=-test_ca" },
                    },
                    install = {
                        { "make", "install_sw" },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            default_version = "4.0.3",
        },
    },
    versions = {
        ["4.0.2"] = {
            digests = {
                ["aarch64-linux"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
                ["aarch64-macos"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
                ["x86_64-linux"] = "736b467530f916737b7031310ccb21d8218c6229e61e8e160cd1d3458cd543a8",
            },
            revision = 2,
        },
        ["4.0.3"] = {
            digests = {
                ["aarch64-linux"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
                ["aarch64-macos"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
                ["x86_64-linux"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
            },
        },
    },
}
