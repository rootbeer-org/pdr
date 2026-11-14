return {
    name = "openexr",
    description = "OpenEXR high dynamic-range image file format library and tools",
    homepage = "https://openexr.com/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "AcademySoftwareFoundation/openexr",
        repository_id = 3533348,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/AcademySoftwareFoundation/openexr/releases/download/v{version}/openexr-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openexr-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
            {
                package = "imath",
                kind = "link_runtime",
            },
            {
                package = "libdeflate",
                kind = "link_runtime",
            },
            {
                package = "zstd",
                kind = "link_runtime",
            },
        },
        libraries = {
            "lib/libOpenEXR.{shared_extension}",
            "lib/libOpenEXRCore.{shared_extension}",
            "lib/libOpenEXRUtil.{shared_extension}",
            "lib/libIex.{shared_extension}",
            "lib/libIlmThread.{shared_extension}",
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
                    "-DOPENEXR_BUILD_TOOLS=ON",
                    "-DOPENEXR_INSTALL_TOOLS=ON",
                    "-DOPENEXR_BUILD_EXAMPLES=OFF",
                    "-DOPENEXR_INSTALL_DOCS=OFF",
                    "-DBUILD_WEBSITE=OFF",
                    "-DOPENEXR_BUILD_PYTHON=OFF",
                    "-DOPENEXR_INSTALL_PKG_CONFIG=ON",
                    "-DOPENEXR_FORCE_INTERNAL_IMATH=OFF",
                    "-DOPENEXR_FORCE_INTERNAL_DEFLATE=OFF",
                    "-DOPENEXR_FORCE_INTERNAL_ZSTD=OFF",
                    "-Dzstd_DIR={dependencies.zstd}/lib/cmake/zstd",
                },
                -- OpenEXR silently falls back to vendored zstd when find_package fails.
                {
                    "sh",
                    "-c",
                    'grep -rq "undef OPENEXR_USE_INTERNAL_ZSTD" build --include=OpenEXRConfigInternal.h || { echo "openexr: vendored zstd in use" >&2; exit 1; }',
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
        bins = {
            "exrinfo",
            "exrheader",
            "exrmaketiled",
            "exrstdattr",
            "exrmultiview",
            "exrmultipart",
            "exrenvmap",
            "exr2aces",
            "exrmanifest",
            "exrmakepreview",
            "exrmetrics",
        },
        checks = {
            { "exrinfo", "--version" },
            { "exrheader", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.5.4",
        },
        ["aarch64-macos"] = {
            default_version = "3.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "3.5.4",
        },
    },
    versions = {
        ["3.5.4"] = {
            digests = {
                ["aarch64-linux"] = "a09706c88ab83a90c26e7ee06cb7e6fa03a57726931eaec557c2e7eaf35c1b13",
                ["aarch64-macos"] = "a09706c88ab83a90c26e7ee06cb7e6fa03a57726931eaec557c2e7eaf35c1b13",
                ["x86_64-linux"] = "a09706c88ab83a90c26e7ee06cb7e6fa03a57726931eaec557c2e7eaf35c1b13",
            },
        },
    },
}
