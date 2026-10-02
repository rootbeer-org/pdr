return {
    name = "zstd",
    description = "Zstandard compression library and tools",
    homepage = "https://facebook.github.io/zstd/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause OR GPL-2.0-only",
    upstream = {
        github = "facebook/zstd",
        repository_id = 29759715,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/facebook/zstd/releases/download/{tag}/zstd-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "zstd-{version}",
    },
    build = {
        backend = "custom",
        -- playTests pipes into diff, which buffers stdin in /tmp.
        allow = { "tmp" },
        dependencies = {
            {
                package = "cmake",
                version = "4.4.3",
                kind = "all",
            },
            {
                package = "lz4",
                version = "1.10.0",
                kind = "link_runtime",
            },
            {
                package = "xz",
                version = "5.8.3",
                kind = "all",
            },
            {
                package = "zlib",
                version = "1.3.2",
                kind = "link_runtime",
            },
        },
        libraries = { "lib/libzstd.a", "lib/libzstd.{shared_extension}" },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    "build/cmake",
                    "-B",
                    "output",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DZSTD_BUILD_SHARED=ON",
                    "-DZSTD_BUILD_STATIC=ON",
                    "-DZSTD_BUILD_TESTS=ON",
                    "-DZSTD_MULTITHREAD_SUPPORT=ON",
                    "-DZSTD_LEGACY_SUPPORT=ON",
                    "-DZSTD_ZLIB_SUPPORT=ON",
                    "-DZSTD_LZMA_SUPPORT=ON",
                    "-DZSTD_LZ4_SUPPORT=ON",
                    "-DZSTD_FUZZER_FLAGS=-T60s",
                    "-DZSTD_ZSTREAM_FLAGS=-T60s",
                    "-DZSTD_FULLBENCH_FLAGS=-i1",
                    "-DZLIB_INCLUDE_DIR={dependencies.zlib}/include",
                    "-DZLIB_LIBRARY={dependencies.zlib}/lib/libz.{shared_extension}",
                    "-DLIBLZMA_INCLUDE_DIR={dependencies.xz}/include",
                    "-DLIBLZMA_LIBRARY={dependencies.xz}/lib/liblzma.a",
                    "-DLIBLZ4_INCLUDE_DIR={dependencies.lz4}/include",
                    "-DLIBLZ4_LIBRARY={dependencies.lz4}/lib/liblz4.{shared_extension}",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
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
                { "cmake", "--install", "output" },
            },
        },
    },
    outputs = {
        bins = { "zstd", "zstdcat", "unzstd", "zstdmt" },
        checks = {
            { "zstd", "--version" },
            { "zstd", "-vv", "--version" },
            { "zstdcat", "--version" },
            { "unzstd", "--version" },
            { "zstdmt", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.5.7",
        },
        ["aarch64-macos"] = {
            default_version = "1.5.7",
        },
        ["x86_64-linux"] = {
            default_version = "1.5.7",
        },
    },
    versions = {
        ["1.5.7"] = {
            digests = {
                ["aarch64-linux"] = "eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3",
                ["aarch64-macos"] = "eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3",
                ["x86_64-linux"] = "eb33e51f49a15e023950cd7825ca74a4a2b43db8354825ac24fc1b7ee09e6fa3",
            },
            revision = 2,
        },
    },
}
