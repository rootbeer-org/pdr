return {
    name = "libfido2",
    description = "Library and tools for FIDO2 and U2F security keys",
    homepage = "https://developers.yubico.com/libfido2/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "Yubico/libfido2",
    },
    source = {
        url = "https://developers.yubico.com/libfido2/Releases/libfido2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libfido2-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                version = "4.4.3",
                kind = "build",
            },
            {
                package = "pkgconf",
                version = "3.0.7",
                kind = "build",
            },
            {
                package = "libcbor",
                version = "0.14.0",
                kind = "link",
            },
            {
                package = "openssl",
                version = "4.0.2",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                version = "1.3.2",
                kind = "link_runtime",
            },
            {
                -- libudev-zero enumerates hidraw devices without udevd or systemd.
                package = "libudev-zero",
                version = "1.0.5",
                kind = "link",
            },
        },
        libraries = { "lib/libfido2.a", "lib/libfido2.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "output",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                    "-DCMAKE_INSTALL_BINDIR=/bin",
                    "-DCMAKE_INSTALL_MANDIR=/share/man",
                    "-DCMAKE_PREFIX_PATH={dependencies}",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DBUILD_STATIC_LIBS=ON",
                    "-DBUILD_TESTS=ON",
                    "-DBUILD_EXAMPLES=OFF",
                    "-DBUILD_TOOLS=ON",
                    "-DBUILD_MANPAGES=ON",
                    -- Pinned off so the output never depends on host mandoc or gzip; plain mdoc
                    -- pages still install.
                    "-DMANDOC_PATH=MANDOC_PATH-NOTFOUND",
                    "-DGZIP_PATH=GZIP_PATH-NOTFOUND",
                },
            },
            build = {
                { "cmake", "--build", "output", "--parallel", "{jobs}" },
            },
            check = {
                {
                    "ctest",
                    "--test-dir",
                    "output",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                },
            },
            install = {
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "output" },
            },
        },
    },
    outputs = {
        bins = { "fido2-assert", "fido2-cred", "fido2-token" },
        checks = {
            { "fido2-token", "-V" },
            { "fido2-token", "-L" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.17.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.17.0",
            build = {
                backend = "custom",
                dependencies = {
                    {
                        package = "cmake",
                        version = "4.4.3",
                        kind = "build",
                    },
                    {
                        package = "pkgconf",
                        version = "3.0.7",
                        kind = "build",
                    },
                    {
                        package = "libcbor",
                        version = "0.14.0",
                        kind = "link",
                    },
                    {
                        package = "openssl",
                        version = "4.0.2",
                        kind = "link_runtime",
                    },
                    {
                        package = "zlib",
                        version = "1.3.2",
                        kind = "link_runtime",
                    },
                },
                libraries = { "lib/libfido2.a", "lib/libfido2.{shared_extension}" },
                steps = {
                    configure = {
                        {
                            "cmake",
                            "-S",
                            ".",
                            "-B",
                            "output",
                            "-DCMAKE_BUILD_TYPE=Release",
                            "-DCMAKE_INSTALL_PREFIX=/",
                            "-DCMAKE_INSTALL_LIBDIR=/lib",
                            "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                            "-DCMAKE_INSTALL_BINDIR=/bin",
                            "-DCMAKE_INSTALL_MANDIR=/share/man",
                            "-DCMAKE_PREFIX_PATH={dependencies}",
                            "-DBUILD_SHARED_LIBS=ON",
                            "-DBUILD_STATIC_LIBS=ON",
                            "-DBUILD_TESTS=ON",
                            "-DBUILD_EXAMPLES=OFF",
                            "-DBUILD_TOOLS=ON",
                            "-DBUILD_MANPAGES=ON",
                            "-DMANDOC_PATH=MANDOC_PATH-NOTFOUND",
                            "-DGZIP_PATH=GZIP_PATH-NOTFOUND",
                            -- macOS provides PCSC.framework; Linux would need a host pcscd, so it stays
                            -- off there until rb can own that service.
                            "-DUSE_PCSC=ON",
                        },
                    },
                    build = {
                        { "cmake", "--build", "output", "--parallel", "{jobs}" },
                    },
                    check = {
                        {
                            "ctest",
                            "--test-dir",
                            "output",
                            "--output-on-failure",
                            "--no-tests=error",
                            "--parallel",
                            "{jobs}",
                        },
                    },
                    install = {
                        { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "output" },
                    },
                },
            },
        },
        ["x86_64-linux"] = {
            default_version = "1.17.0",
        },
    },
    versions = {
        ["1.17.0"] = {
            digests = {
                ["aarch64-linux"] = "c1012c8871d71b65872fd5ff1a9d6b0838a55683a03e85ba97479ce57129c736",
                ["aarch64-macos"] = "c1012c8871d71b65872fd5ff1a9d6b0838a55683a03e85ba97479ce57129c736",
                ["x86_64-linux"] = "c1012c8871d71b65872fd5ff1a9d6b0838a55683a03e85ba97479ce57129c736",
            },
        },
    },
}
