return {
    name = "cmake",
    description = "Configure, build, test, and package software",
    homepage = "https://cmake.org/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "Kitware/CMake",
        repository_id = 537699,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/Kitware/CMake/releases/download/v{version}/cmake-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "cmake-{version}",
    },
    build = {
        backend = "custom",
        -- The debugger tests bind Unix sockets in the build directory.
        allow = { "local-network" },
        dependencies = {
            {
                package = "openssl",
                kind = "all",
            },
        },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./bootstrap",
                    "--prefix={prefix}",
                    "--parallel={jobs}",
                    "--",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_TESTING=ON",
                    "-DBUILD_CursesDialog=OFF",
                    "-DOPENSSL_ROOT_DIR={dependencies.openssl}",
                    "-DOPENSSL_USE_STATIC_LIBS=ON",
                },
            },
            build = {
                { "make", "-j{jobs}" },
            },
            check = {
                {
                    "./bin/ctest",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                    "-R",
                    "^CMakeLib[.]",
                },
            },
            install = {
                { "make", "install" },
            },
        },
    },
    outputs = {
        bins = { "cmake", "ctest", "cpack" },
        checks = {
            { "cmake", "--version" },
            { "cmake", "-E", "capabilities" },
            { "cmake", "--system-information" },
            { "ctest", "--version" },
            { "cpack", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.5.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.5.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.5.0",
        },
    },
    versions = {
        ["4.4.5"] = {
            digests = {
                ["aarch64-linux"] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2",
                ["aarch64-macos"] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2",
                ["x86_64-linux"] = "a0c54c88abb8078dd8eccadb717fc6bb194bf18e7d44c86309910288886e04e2",
            },
        },
        ["4.5.0"] = {
            digests = {
                ["aarch64-linux"] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213",
                ["aarch64-macos"] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213",
                ["x86_64-linux"] = "424352d6133e8455e020da787008e8dc67abb18820af3532572ab35657e49213",
            },
        },
    },
}
