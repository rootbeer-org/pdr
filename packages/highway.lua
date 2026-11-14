return {
    name = "highway",
    description = "Portable SIMD library and intrinsics wrapper",
    homepage = "https://github.com/google/highway",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0 OR BSD-3-Clause",
    upstream = {
        github = "google/highway",
        repository_id = 312836371,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/google/highway/releases/download/{version}/highway-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "highway-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libhwy.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "cmake-build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DHWY_ENABLE_TESTS=OFF",
                    "-DHWY_ENABLE_EXAMPLES=OFF",
                    "-DHWY_ENABLE_CONTRIB=OFF",
                    "-DBUILD_TESTING=OFF",
                },
            },
            build = {
                { "cmake", "--build", "cmake-build", "--parallel", "{jobs}" },
            },
            install = {
                { "cmake", "--install", "cmake-build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.4.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.4.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.4.0",
        },
    },
    versions = {
        ["1.4.0"] = {
            digests = {
                ["aarch64-linux"] = "36f672ab48ddb3c8555e9e89e16fe400cd7d16c6eb455a1a3d0c146a63ababdc",
                ["aarch64-macos"] = "36f672ab48ddb3c8555e9e89e16fe400cd7d16c6eb455a1a3d0c146a63ababdc",
                ["x86_64-linux"] = "36f672ab48ddb3c8555e9e89e16fe400cd7d16c6eb455a1a3d0c146a63ababdc",
            },
        },
    },
}
