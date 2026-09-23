return {
    name = "cmake",
    description = "Configure, build, test, and package software",
    homepage = "https://cmake.org/",
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
        dependencies = { "openssl@4.0.2" },
        steps = {
            configure = {
                {
                    "/bin/sh",
                    "./bootstrap",
                    "--prefix=/",
                    "--parallel={jobs}",
                    "--",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_TESTING=ON",
                    "-DBUILD_CursesDialog=OFF",
                    "-DOPENSSL_ROOT_DIR={dependencies}",
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
                { "make", "DESTDIR={prefix}", "install" },
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
            default_version = "4.4.3",
        },
        ["aarch64-macos"] = {
            default_version = "4.4.3",
        },
        ["x86_64-linux"] = {
            default_version = "4.4.3",
        },
    },
    versions = {
        ["4.4.3"] = {
            digests = {
                ["aarch64-linux"] = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0",
                ["aarch64-macos"] = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0",
                ["x86_64-linux"] = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0",
            },
            revision = 3,
        },
    },
}
