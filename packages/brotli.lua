return {
    name = "brotli",
    description = "Brotli compression library and command-line tool",
    homepage = "https://github.com/google/brotli",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/google/brotli/archive/refs/tags/v1.2.0.tar.gz",
        archive = "tar.gz",
        strip_prefix = "brotli-1.2.0",
    },
    build = {
        backend = "custom",
        dependencies = { "cmake@4.4.3" },
        libraries = { "lib/libbrotlicommon.a", "lib/libbrotlidec.a", "lib/libbrotlienc.a" },
        steps = {
            configure = {
                {
                    "curl",
                    "--fail",
                    "--location",
                    "--retry",
                    "3",
                    "--output",
                    "testdata.txz",
                    "https://github.com/google/brotli/releases/download/v1.2.0/testdata.txz",
                },
                {
                    "/bin/sh",
                    "-ec",
                    "printf '%s  %s\\n' e8624d888f13067e7635353397cf42956bf4ca1382da67f9cec8d43e800deecb testdata.txz | shasum -a 256 -c -",
                },
                { "tar", "-xJf", "testdata.txz" },
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DBROTLI_DISABLE_TESTS=OFF",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    "-DCMAKE_INSTALL_BINDIR=/bin",
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
            check = {
                {
                    "ctest",
                    "--test-dir",
                    "build",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                },
            },
            install = {
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" },
            },
        },
    },
    outputs = {
        bins = { "brotli" },
        checks = {
            { "brotli", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.2.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.2.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.2.0",
        },
    },
    versions = {
        ["1.2.0"] = {
            digests = {
                ["aarch64-linux"] = "816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec",
                ["aarch64-macos"] = "816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec",
                ["x86_64-linux"] = "816c96e8e8f193b40151dad7e8ff37b1221d019dbcb9c35cd3fadbfe6477dfec",
            },
        },
    },
}
