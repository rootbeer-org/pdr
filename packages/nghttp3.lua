return {
    name = "nghttp3",
    description = "HTTP/3 C library",
    homepage = "https://nghttp2.org/nghttp3/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "ngtcp2/nghttp3",
        repository_id = 156868263,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/ngtcp2/nghttp3/releases/download/v{version}/nghttp3-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "nghttp3-{version}",
        patches = {
            "--- a/CMakeLists.txt\010+++ b/CMakeLists.txt\010@@ -178,2 +178,2 @@\010-set(libdir          \"${CMAKE_INSTALL_FULL_LIBDIR}\")\010-set(includedir      \"${CMAKE_INSTALL_FULL_INCLUDEDIR}\")\010+set(libdir          \"\\${prefix}/${CMAKE_INSTALL_LIBDIR}\")\010+set(includedir      \"\\${prefix}/${CMAKE_INSTALL_INCLUDEDIR}\")\010",
        },
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake@4.4.3",
                kind = "build",
            },
        },
        libraries = { "lib/libnghttp3.a" },
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
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
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
            install = {
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.18.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.18.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.18.0",
        },
    },
    versions = {
        ["1.18.0"] = {
            digests = {
                ["aarch64-linux"] = "2812e9c06583fa24c8dc46bdb5291310a69196352ceaca8fbe98106ff36ae7d8",
                ["aarch64-macos"] = "2812e9c06583fa24c8dc46bdb5291310a69196352ceaca8fbe98106ff36ae7d8",
                ["x86_64-linux"] = "2812e9c06583fa24c8dc46bdb5291310a69196352ceaca8fbe98106ff36ae7d8",
            },
        },
    },
}
