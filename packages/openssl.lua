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
        -- TLS, QUIC, and HTTP tests run servers on loopback.
        allow = { "local-network" },
        dependencies = {
            {
                package = "perl",
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
            default_version = "4.1.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.1.0",
            build = {
                backend = "custom",
                -- TLS, QUIC, and HTTP tests run servers on loopback.
                allow = { "local-network" },
                dependencies = {
                    {
                        package = "perl",
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
            default_version = "4.1.0",
        },
    },
    versions = {
        ["4.0.3"] = {
            digests = {
                ["aarch64-linux"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
                ["aarch64-macos"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
                ["x86_64-linux"] = "325b5c806167c13b40b1ffeadfe0248197c00eccc4cf123ec1e28d2d2fd216d9",
            },
        },
        ["4.1.0"] = {
            digests = {
                ["aarch64-linux"] = "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd",
                ["aarch64-macos"] = "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd",
                ["x86_64-linux"] = "50c17baf54cb008f6ce42d50deb4b28050a1aad711636cabd4b241c7e90cc2fd",
            },
        },
    },
}
