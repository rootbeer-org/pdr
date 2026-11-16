return {
    name = "abseil",
    aliases = { "abseil-cpp" },
    description = "C++ common libraries from Google",
    homepage = "https://abseil.io",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "abseil/abseil-cpp",
        repository_id = 104231541,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/abseil/abseil-cpp/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "abseil-cpp-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
        },
        -- Abseil installs about a hundred archives and the set changes between releases, so
        -- this names only the one every other archive depends on.
        libraries = { "lib/libabsl_base.a" },
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
                    "-DBUILD_SHARED_LIBS=OFF",
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    -- Abseil's ABI depends on the standard, so dependents inherit this one.
                    "-DCMAKE_CXX_STANDARD=17",
                    "-DABSL_PROPAGATE_CXX_STD=ON",
                    "-DABSL_BUILD_TESTING=OFF",
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
            default_version = "20260817.0",
        },
        ["aarch64-macos"] = {
            default_version = "20260817.0",
        },
        ["x86_64-linux"] = {
            default_version = "20260817.0",
        },
    },
    versions = {
        ["20260817.0"] = {
            digests = {
                ["aarch64-linux"] = "f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d",
                ["aarch64-macos"] = "f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d",
                ["x86_64-linux"] = "f7e05179df39c45434cad433f5783840bb3788ef322976f9138bc6b72b3a107d",
            },
        },
    },
}
