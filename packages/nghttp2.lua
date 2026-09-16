return {
    schema = 2,
    name = "nghttp2",
    description = "HTTP/2 C library",
    default_version = "1.70.0",
    homepage = "https://nghttp2.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "nghttp2/nghttp2",
        repository_id = 11452676,
        tag_prefix = "v",
    },
    build = {
        backend = "custom",
        dependencies = { "cmake@4.4.3" },
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
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DBUILD_STATIC_LIBS=ON",
                    "-DBUILD_TESTING=ON",
                    "-DENABLE_LIB_ONLY=ON",
                    "-DENABLE_DOC=OFF",
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
            check = {
                {
                    "cmake",
                    "--build",
                    "build",
                    "--target",
                    "main",
                    "failmalloc",
                    "--parallel",
                    "{jobs}",
                },
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
    inputs = {
        source = {
            url = "https://github.com/nghttp2/nghttp2/releases/download/v{version}/nghttp2-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "nghttp2-{version}",
            -- Keep pkg-config paths aligned with the relative install directories.
            patches = {
                [[
--- a/CMakeLists.txt
+++ b/CMakeLists.txt
@@ -445,8 +445,8 @@
 # libnghttp2.pc (pkg-config file)
 set(prefix          "${CMAKE_INSTALL_PREFIX}")
 set(exec_prefix     "${CMAKE_INSTALL_PREFIX}")
-set(libdir          "${CMAKE_INSTALL_FULL_LIBDIR}")
-set(includedir      "${CMAKE_INSTALL_FULL_INCLUDEDIR}")
+set(libdir          "\${prefix}/${CMAKE_INSTALL_LIBDIR}")
+set(includedir      "\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")
 set(VERSION         "${PACKAGE_VERSION}")
 # For init scripts and systemd service file (in contrib/)
 set(bindir          "${CMAKE_INSTALL_FULL_BINDIR}")
]],
            },
        },
    },
    outputs = {
        libraries = { "lib/libnghttp2.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["1.70.0"] = {
            inputs = {
                source = {
                    sha256 = "aa317e2cf9dca6afa0aed68f8fad6ff303ec6982e25a78c75c0b65e2b9b3ded5",
                },
            },
        },
    },
}
