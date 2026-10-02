return {
    name = "libcbor",
    description = "CBOR protocol implementation for C",
    homepage = "https://github.com/PJK/libcbor",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "PJK/libcbor",
        repository_id = 28867623,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/PJK/libcbor/archive/refs/tags/v{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libcbor-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                version = "4.4.3",
                kind = "build",
            },
            {
                package = "cmocka",
                version = "2.0.2",
                kind = "link",
            },
        },
        libraries = { "lib/libcbor.a" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    -- libcbor ships a Bazel BUILD file, which a build/ directory collides with on
                    -- case-insensitive macOS.
                    "output",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    -- Absolute: GNUInstallDirs maps prefix / to /usr for FULL install paths.
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DWITH_EXAMPLES=OFF",
                    "-DWITH_TESTS=ON",
                    "-DSANITIZE=OFF",
                    -- Release builds default to LTO, which would put bitcode in the static archive.
                    "-DCMAKE_INTERPROCEDURAL_OPTIMIZATION_RELEASE=OFF",
                },
            },
            build = {
                { "cmake", "--build", "output", "--parallel", "{jobs}" },
            },
            check = {
                {
                    "ctest",
                    "--test-dir",
                    "output",
                    "--output-on-failure",
                    "--no-tests=error",
                    "--parallel",
                    "{jobs}",
                },
            },
            install = {
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "output" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.14.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.14.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.14.0",
        },
    },
    versions = {
        ["0.14.0"] = {
            digests = {
                ["aarch64-linux"] = "a8c1516e741562cf95aa4479c64916c3d4d2623e24fdc35e414e2320e7300aae",
                ["aarch64-macos"] = "a8c1516e741562cf95aa4479c64916c3d4d2623e24fdc35e414e2320e7300aae",
                ["x86_64-linux"] = "a8c1516e741562cf95aa4479c64916c3d4d2623e24fdc35e414e2320e7300aae",
            },
        },
    },
}
