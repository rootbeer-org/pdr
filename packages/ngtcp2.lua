return {
    name = "ngtcp2",
    description = "QUIC transport library with OpenSSL support",
    homepage = "https://github.com/ngtcp2/ngtcp2",
    default_license = "MIT",
    source = {
        url = "https://github.com/ngtcp2/ngtcp2/releases/download/v{version}/ngtcp2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "ngtcp2-{version}",
        patches = {
            '--- a/CMakeLists.txt\n+++ b/CMakeLists.txt\n@@ -380,2 +380,2 @@\n-set(libdir          "${CMAKE_INSTALL_FULL_LIBDIR}")\n-set(includedir      "${CMAKE_INSTALL_FULL_INCLUDEDIR}")\n+set(libdir          "\\${prefix}/${CMAKE_INSTALL_LIBDIR}")\n+set(includedir      "\\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")\n',
        },
    },
    build = {
        backend = "custom",
        dependencies = {
            { kind = "build", package = "cmake@4.4.3" },
            { kind = "link", package = "openssl@4.0.2" },
        },
        libraries = { "lib/libngtcp2.a", "lib/libngtcp2_crypto_ossl.a" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    "-DCMAKE_POLICY_DEFAULT_CMP0193=NEW",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DENABLE_SHARED_LIB=OFF",
                    "-DENABLE_STATIC_LIB=ON",
                    "-DENABLE_LIB_ONLY=ON",
                    "-DBUILD_TESTING=ON",
                    "-DENABLE_OPENSSL=ON",
                    "-DOPENSSL_USE_STATIC_LIBS=ON",
                    "-DOPENSSL_ROOT_DIR={dependencies}",
                    "-DCMAKE_PREFIX_PATH={dependencies}",
                },
            },
            build = { { "cmake", "--build", "build", "--parallel", "{jobs}" } },
            check = {
                { "cmake", "--build", "build", "--target", "main", "--parallel", "{jobs}" },
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
            install = { { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" } },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.25.0",
            upstream = { github = "ngtcp2/ngtcp2", repository_id = 95347622, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "1.25.0",
            upstream = { github = "ngtcp2/ngtcp2", repository_id = 95347622, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "1.25.0",
            upstream = { github = "ngtcp2/ngtcp2", repository_id = 95347622, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.25.0"] = {
            digests = {
                ["aarch64-linux"] = "1c0843076528a87b65e9a9d455100941f4cb65d44f96c5da6ae56df146043955",
                ["aarch64-macos"] = "1c0843076528a87b65e9a9d455100941f4cb65d44f96c5da6ae56df146043955",
                ["x86_64-linux"] = "1c0843076528a87b65e9a9d455100941f4cb65d44f96c5da6ae56df146043955",
            },
        },
    },
}
