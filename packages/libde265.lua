return {
    name = "libde265",
    description = "Open H.265/HEVC video decoder library",
    homepage = "https://github.com/strukturag/libde265",
    recipe_maintainers = { "tale" },
    default_license = "LGPL-3.0-or-later",
    upstream = {
        github = "strukturag/libde265",
        repository_id = 12384165,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/strukturag/libde265/releases/download/v{version}/libde265-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libde265-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libde265.{shared_extension}" },
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
                    "-DENABLE_SDL=OFF",
                    "-DENABLE_DECODER=ON",
                    "-DENABLE_ENCODER=OFF",
                    "-DENABLE_SHERLOCK265=OFF",
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
        bins = { "dec265" },
        checks = {
            { "dec265", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.1.3",
        },
        ["aarch64-macos"] = {
            default_version = "1.1.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.1.3",
        },
    },
    versions = {
        ["1.1.3"] = {
            digests = {
                ["aarch64-linux"] = "554228bd17788c99a7e63b37ab5634722190e6e2bf60c1dcb01cef328e133905",
                ["aarch64-macos"] = "554228bd17788c99a7e63b37ab5634722190e6e2bf60c1dcb01cef328e133905",
                ["x86_64-linux"] = "554228bd17788c99a7e63b37ab5634722190e6e2bf60c1dcb01cef328e133905",
            },
        },
    },
}
