return {
    name = "fmt",
    description = "Open-source formatting library for C++",
    homepage = "https://fmt.dev/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "fmtlib/fmt",
        repository_id = 7056202,
        tag = "{version}",
    },
    source = {
        url = "https://github.com/fmtlib/fmt/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "fmt-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
        },
        libraries = { "lib/libfmt.a", "lib/libfmt.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build-static",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    "-DFMT_TEST=OFF",
                    "-DFMT_DOC=OFF",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                },
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build-shared",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DFMT_TEST=OFF",
                    "-DFMT_DOC=OFF",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                },
            },
            build = {
                { "cmake", "--build", "build-static", "--parallel", "{jobs}" },
                { "cmake", "--build", "build-shared", "--parallel", "{jobs}" },
            },
            install = {
                -- Installed last so the shared build's cmake package files win.
                { "cmake", "--install", "build-static" },
                { "cmake", "--install", "build-shared" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "12.2.1",
        },
        ["aarch64-macos"] = {
            default_version = "12.2.1",
        },
        ["x86_64-linux"] = {
            default_version = "12.2.1",
        },
    },
    versions = {
        ["12.2.1"] = {
            digests = {
                ["aarch64-linux"] = "449374d74f31b67796dece454d59b93e6f1538efcce0e9ac78000c98142c139e",
                ["aarch64-macos"] = "449374d74f31b67796dece454d59b93e6f1538efcce0e9ac78000c98142c139e",
                ["x86_64-linux"] = "449374d74f31b67796dece454d59b93e6f1538efcce0e9ac78000c98142c139e",
            },
        },
    },
}
