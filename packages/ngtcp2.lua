return {
    schema = 2,
    name = "ngtcp2",
    description = "QUIC transport library with OpenSSL support",
    default_version = "1.25.0",
    homepage = "https://github.com/ngtcp2/ngtcp2",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = { github = "ngtcp2/ngtcp2", repository_id = 95347622, tag_prefix = "v" },
    build = {
        backend = "custom",
        dependencies = {
            { package = "cmake@4.4.3", kind = "build" },
            { package = "openssl@4.0.2", kind = "link" },
        },
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
    inputs = {
        source = {
            url = "https://github.com/ngtcp2/ngtcp2/releases/download/v{version}/ngtcp2-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "ngtcp2-{version}",
            patches = {
                [[
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -380,2 +380,2 @@
-set(libdir          "${CMAKE_INSTALL_FULL_LIBDIR}")
-set(includedir      "${CMAKE_INSTALL_FULL_INCLUDEDIR}")
+set(libdir          "\${prefix}/${CMAKE_INSTALL_LIBDIR}")
+set(includedir      "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
]],
            },
        },
    },
    outputs = {
        libraries = { "lib/libngtcp2.a", "lib/libngtcp2_crypto_ossl.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["1.25.0"] = {
            inputs = {
                source = {
                    sha256 = "1c0843076528a87b65e9a9d455100941f4cb65d44f96c5da6ae56df146043955",
                },
            },
        },
    },
}
