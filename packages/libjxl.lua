return {
    name = "libjxl",
    description = "JPEG XL reference implementation and tools",
    homepage = "https://jpeg.org/jpegxl/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "libjxl/libjxl",
        repository_id = 340219494,
        tag = "v{version}",
        exclude_tags = { "v*snapshot*" },
    },
    source = {
        url = "https://github.com/libjxl/libjxl/archive/refs/tags/v{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libjxl-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
            {
                package = "pkgconf",
                kind = "build",
            },
            {
                package = "highway",
                kind = "link_runtime",
            },
            {
                package = "brotli",
                kind = "link_runtime",
            },
            {
                package = "lcms2",
                kind = "link_runtime",
            },
            {
                package = "libpng",
                kind = "link_runtime",
            },
            {
                package = "libjpeg-turbo",
                kind = "link_runtime",
            },
            {
                package = "zlib",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libjxl.{shared_extension}",
            "lib/libjxl_threads.{shared_extension}",
            "lib/libjxl_cms.{shared_extension}",
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
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DBUILD_TESTING=OFF",
                    "-DJPEGXL_FORCE_SYSTEM_HWY=ON",
                    "-DJPEGXL_FORCE_SYSTEM_BROTLI=ON",
                    "-DJPEGXL_FORCE_SYSTEM_LCMS2=ON",
                    "-DJPEGXL_ENABLE_SKCMS=OFF",
                    "-DJPEGXL_ENABLE_SJPEG=OFF",
                    "-DJPEGXL_ENABLE_BENCHMARK=OFF",
                    "-DJPEGXL_ENABLE_EXAMPLES=OFF",
                    "-DJPEGXL_ENABLE_MANPAGES=OFF",
                    "-DJPEGXL_ENABLE_DOXYGEN=OFF",
                    "-DJPEGXL_ENABLE_JNI=OFF",
                    "-DJPEGXL_ENABLE_PLUGINS=OFF",
                    "-DJPEGXL_ENABLE_OPENEXR=OFF",
                    "-DJPEGXL_ENABLE_TOOLS=ON",
                    "-DJPEGXL_ENABLE_VIEWERS=OFF",
                    "-DJPEGXL_ENABLE_DEVTOOLS=OFF",
                    "-DJPEGXL_ENABLE_FUZZERS=OFF",
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
    outputs = {
        bins = { "cjxl", "djxl", "jxlinfo" },
        checks = {
            { "cjxl", "--version" },
            { "djxl", "--version" },
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && printf 'iVBORw0KGgoAAAANSUhEUgAAAAEAAAABCAYAAAAfFcSJAAAADUlEQVR42mNkYPhfDwAChwGA60e6kgAAAABJRU5ErkJggg==' | base64 -d > $d/in.png && cjxl $d/in.png $d/out.jxl >/dev/null 2>&1 && jxlinfo $d/out.jxl >/dev/null 2>&1 && djxl $d/out.jxl $d/back.png >/dev/null 2>&1 && test -s $d/back.png && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.13.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.13.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.13.0",
        },
    },
    versions = {
        ["0.13.0"] = {
            digests = {
                ["aarch64-linux"] = "24d18c9af2d1f5a17730b3f8d3f70a5c16e5ac303f5d9d5fe9dc00cf7ca82af2",
                ["aarch64-macos"] = "24d18c9af2d1f5a17730b3f8d3f70a5c16e5ac303f5d9d5fe9dc00cf7ca82af2",
                ["x86_64-linux"] = "24d18c9af2d1f5a17730b3f8d3f70a5c16e5ac303f5d9d5fe9dc00cf7ca82af2",
            },
        },
    },
}
