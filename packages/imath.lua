return {
    name = "imath",
    description = "Basic math and linear algebra library for graphics",
    homepage = "https://imath.readthedocs.io/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "AcademySoftwareFoundation/Imath",
        repository_id = 271841243,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/AcademySoftwareFoundation/Imath/releases/download/v{version}/Imath-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "Imath-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libImath.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DBUILD_TESTING=OFF",
                    "-DPYTHON=OFF",
                    "-DIMATH_INSTALL_PKG_CONFIG=ON",
                },
            },
            build = {
                { "cmake", "--build", "build", "--parallel", "{jobs}" },
            },
            install = {
                { "cmake", "--install", "build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.2.3",
        },
        ["aarch64-macos"] = {
            default_version = "3.2.3",
        },
        ["x86_64-linux"] = {
            default_version = "3.2.3",
        },
    },
    versions = {
        ["3.2.3"] = {
            digests = {
                ["aarch64-linux"] = "72f498e7073890a2a1b870e453908a07c9725f9d1384527043a38578bfb4ef31",
                ["aarch64-macos"] = "72f498e7073890a2a1b870e453908a07c9725f9d1384527043a38578bfb4ef31",
                ["x86_64-linux"] = "72f498e7073890a2a1b870e453908a07c9725f9d1384527043a38578bfb4ef31",
            },
        },
    },
}
