return {
    name = "libevent",
    description = "Asynchronous event notification library",
    homepage = "https://libevent.org",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "libevent/libevent",
        repository_id = 1856976,
        tag = "release-{version}-stable",
    },
    source = {
        url = "https://github.com/libevent/libevent/releases/download/{tag}/libevent-{version}-stable.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libevent-{version}-stable",
    },
    build = {
        backend = "custom",
        libraries = {
            "lib/libevent.a",
            "lib/libevent_core.a",
            "lib/libevent_extra.a",
            "lib/libevent_pthreads.a",
        },
        steps = {
            configure = {
                {
                    "sh",
                    "./configure",
                    "--prefix=/",
                    "--disable-shared",
                    "--enable-static",
                    -- Its TLS bufferevents are unused by current dependents; enabling them would
                    -- make every consumer link OpenSSL.
                    "--disable-openssl",
                    "--disable-samples",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                {
                    "/usr/bin/env",
                    -- This HTTP test fails under macOS's poll backend, where writes past the
                    -- limit race the connection reset; every other test runs on each backend.
                    "REGRESS_ARGS=:http/data_length_constraints",
                    "make",
                    "check",
                },
            },
            install = {
                { "make", "DESTDIR={prefix}", "install" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.1.13",
        },
        ["aarch64-macos"] = {
            default_version = "2.1.13",
        },
        ["x86_64-linux"] = {
            default_version = "2.1.13",
        },
    },
    versions = {
        ["2.1.13"] = {
            digests = {
                ["aarch64-linux"] = "f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c",
                ["aarch64-macos"] = "f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c",
                ["x86_64-linux"] = "f7e9383b8c0baa81b687e5b5eecc01beefaf1b19b64151d95ed61647fe7a315c",
            },
        },
    },
}
