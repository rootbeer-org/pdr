return {
    schema = 2,
    name = "cmake",
    description = "Configure, build, test, and package software",
    default_version = "4.4.3",
    homepage = "https://cmake.org/",
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    upstream = {
        github = "Kitware/CMake",
        repository_id = 537699,
        tag_prefix = "v",
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
                    "-DOPENSSL_ROOT_DIR={dependencies}",
                    "-DOPENSSL_USE_STATIC_LIBS=ON",
                },
            },
            build = { { "make", "-j{jobs}" } },
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
            install = { { "make", "DESTDIR={prefix}", "install" } },
        },
    },
    inputs = {
        source = {
            url = "https://github.com/Kitware/CMake/releases/download/v{version}/cmake-{version}.tar.gz",
            archive = "tar.gz",
            strip_prefix = "cmake-{version}",
        },
        prebuilt = {
            github = "Kitware/CMake",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "cmake-{version}-linux-x86_64.tar.gz",
                ["aarch64-macos"] = "cmake-{version}-macos-universal.tar.gz",
                ["aarch64-linux"] = "cmake-{version}-linux-aarch64.tar.gz",
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
    versions = {
        ["4.4.3"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "c46400618b4f1f2b43507f24fb22f3ae830c3416cf23b776e16e1d413aa892f0",
                },
            },
        },
    },
}
