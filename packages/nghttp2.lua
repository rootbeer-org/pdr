return {
    name = "nghttp2",
    description = "HTTP/2 C library",
    homepage = "https://nghttp2.org/",
    default_license = "NOASSERTION",
    source = {
        url = "https://github.com/nghttp2/nghttp2/releases/download/v{version}/nghttp2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "nghttp2-{version}",
        patches = {
            '--- a/CMakeLists.txt\n+++ b/CMakeLists.txt\n@@ -445,8 +445,8 @@\n # libnghttp2.pc (pkg-config file)\n set(prefix          "${CMAKE_INSTALL_PREFIX}")\n set(exec_prefix     "${CMAKE_INSTALL_PREFIX}")\n-set(libdir          "${CMAKE_INSTALL_FULL_LIBDIR}")\n-set(includedir      "${CMAKE_INSTALL_FULL_INCLUDEDIR}")\n+set(libdir          "\\${prefix}/${CMAKE_INSTALL_LIBDIR}")\n+set(includedir      "\\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}")\n set(VERSION         "${PACKAGE_VERSION}")\n # For init scripts and systemd service file (in contrib/)\n set(bindir          "${CMAKE_INSTALL_FULL_BINDIR}")\n',
        },
    },
    build = {
        backend = "custom",
        dependencies = { "cmake@4.4.3" },
        libraries = { "lib/libnghttp2.a" },
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
            build = { { "cmake", "--build", "build", "--parallel", "{jobs}" } },
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
            install = { { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" } },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.70.0",
            upstream = { github = "nghttp2/nghttp2", repository_id = 11452676, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "1.70.0",
            upstream = { github = "nghttp2/nghttp2", repository_id = 11452676, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "1.70.0",
            upstream = { github = "nghttp2/nghttp2", repository_id = 11452676, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.70.0"] = {
            digests = {
                ["aarch64-linux"] = "aa317e2cf9dca6afa0aed68f8fad6ff303ec6982e25a78c75c0b65e2b9b3ded5",
                ["aarch64-macos"] = "aa317e2cf9dca6afa0aed68f8fad6ff303ec6982e25a78c75c0b65e2b9b3ded5",
                ["x86_64-linux"] = "aa317e2cf9dca6afa0aed68f8fad6ff303ec6982e25a78c75c0b65e2b9b3ded5",
            },
        },
    },
}
