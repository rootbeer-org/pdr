return {
    name = "libjpeg-turbo",
    description = "SIMD-accelerated JPEG codec library",
    homepage = "https://libjpeg-turbo.org/",
    recipe_maintainers = { "tale" },
    default_license = "IJG AND BSD-3-Clause AND Zlib",
    upstream = {
        github = "libjpeg-turbo/libjpeg-turbo",
        repository_id = 39760454,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/{version}/libjpeg-turbo-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libjpeg-turbo-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = {
            "lib/libjpeg.a",
            "lib/libjpeg.{shared_extension}",
            "lib/libturbojpeg.a",
            "lib/libturbojpeg.{shared_extension}",
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
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DENABLE_SHARED=ON",
                    "-DENABLE_STATIC=ON",
                    "-DWITH_JPEG8=ON",
                    "-DREQUIRE_SIMD=ON",
                    "-DWITH_JAVA=OFF",
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
                { "cmake", "--install", "build" },
            },
        },
    },
    outputs = {
        bins = { "cjpeg", "djpeg", "jpegtran", "rdjpgcom", "wrjpgcom", "tjbench" },
        checks = {
            { "cjpeg", "-version" },
            { "jpegtran", "-version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.2.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.2.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.2.1",
        },
    },
    versions = {
        ["3.2.1"] = {
            digests = {
                ["aarch64-linux"] = "c27ad72a68da151177929aa969ae773a2da5ac2af9ce946079314fdac8cece7f",
                ["aarch64-macos"] = "c27ad72a68da151177929aa969ae773a2da5ac2af9ce946079314fdac8cece7f",
                ["x86_64-linux"] = "c27ad72a68da151177929aa969ae773a2da5ac2af9ce946079314fdac8cece7f",
            },
        },
    },
}
