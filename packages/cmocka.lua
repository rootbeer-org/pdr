return {
    name = "cmocka",
    description = "Unit testing framework for C with mock object support",
    homepage = "https://cmocka.org/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    -- Released only on cmocka.org and GitLab, so versions are updated by hand until
    -- discovery supports another provider.
    source = {
        url = "https://cmocka.org/files/{major}.{minor}/cmocka-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "cmocka-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake@4.4.3",
                kind = "build",
            },
        },
        libraries = { "lib/libcmocka.a" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX=/",
                    -- GNUInstallDirs maps prefix / to /usr for the FULL paths cmocka installs to,
                    -- so the directories are absolute.
                    "-DCMAKE_INSTALL_LIBDIR=/lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=/include",
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DWITH_EXAMPLES=OFF",
                    "-DUNIT_TESTING=ON",
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
                { "/usr/bin/env", "DESTDIR={prefix}", "cmake", "--install", "build" },
            },
        },
    },
    outputs = {},
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.0.2",
        },
    },
    versions = {
        ["2.0.2"] = {
            digests = {
                ["aarch64-linux"] = "39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416",
                ["aarch64-macos"] = "39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416",
                ["x86_64-linux"] = "39f92f366bdf3f1a02af4da75b4a5c52df6c9f7e736c7d65de13283f9f0ef416",
            },
        },
    },
}
