return {
    name = "nghttp2",
    description = "HTTP/2 C library",
    homepage = "https://nghttp2.org/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "nghttp2/nghttp2",
        repository_id = 11452676,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/nghttp2/nghttp2/releases/download/v{version}/nghttp2-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "nghttp2-{version}",
        patches = {
            "--- a/CMakeLists.txt\010+++ b/CMakeLists.txt\010@@ -445,8 +445,8 @@\010 # libnghttp2.pc (pkg-config file)\010 set(prefix          \"${CMAKE_INSTALL_PREFIX}\")\010 set(exec_prefix     \"${CMAKE_INSTALL_PREFIX}\")\010-set(libdir          \"${CMAKE_INSTALL_FULL_LIBDIR}\")\010-set(includedir      \"${CMAKE_INSTALL_FULL_INCLUDEDIR}\")\010+set(libdir          \"\\${prefix}/${CMAKE_INSTALL_LIBDIR}\")\010+set(includedir      \"\\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}\")\010 set(VERSION         \"${PACKAGE_VERSION}\")\010 # For init scripts and systemd service file (in contrib/)\010 set(bindir          \"${CMAKE_INSTALL_FULL_BINDIR}\")\010",
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
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.70.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.70.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.70.0",
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
