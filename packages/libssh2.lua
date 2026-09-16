return {
    schema = 2,
    name = "libssh2",
    description = "SSH2 client library",
    default_version = "1.11.1",
    homepage = "https://libssh2.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    build = {
        backend = "custom",
        dependencies = { "cmake@4.4.3", "openssl@4.0.2", "zlib@1.3.2" },
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
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                    "-DCMAKE_INSTALL_BINDIR=/bin",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DBUILD_STATIC_LIBS=ON",
                    "-DBUILD_TESTING=ON",
                    "-DCRYPTO_BACKEND=OpenSSL",
                    "-DOPENSSL_ROOT_DIR={dependencies}",
                    "-DCMAKE_SYSTEM_PREFIX_PATH={dependencies}",
                    "-DOPENSSL_USE_STATIC_LIBS=ON",
                    "-DBUILD_EXAMPLES=OFF",
                    "-DENABLE_ZLIB_COMPRESSION=ON",
                    "-DZLIB_INCLUDE_DIR={dependencies}/include",
                    "-DZLIB_LIBRARY={dependencies}/lib/libz.a",
                    "-DRUN_DOCKER_TESTS=OFF",
                    "-DRUN_SSHD_TESTS=OFF",
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
    inputs = {
        source = {
            url = "https://github.com/libssh2/libssh2/releases/download/libssh2-{version}/libssh2-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "libssh2-{version}",
        },
    },
    outputs = {
        libraries = { "lib/libssh2.a" },
        bins = {},
        checks = {},
    },
    versions = {
        ["1.11.1"] = {
            inputs = {
                source = {
                    sha256 = "d9ec76cbe34db98eec3539fe2c899d26b0c837cb3eb466a56b0f109cabf658f7",
                },
            },
        },
    },
}
