return {
    name = "libdeflate",
    description = "Fast DEFLATE, zlib and gzip compression library",
    homepage = "https://github.com/ebiggers/libdeflate",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "ebiggers/libdeflate",
        repository_id = 28554304,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/ebiggers/libdeflate/releases/download/v{version}/libdeflate-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libdeflate-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libdeflate.a", "lib/libdeflate.{shared_extension}" },
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
                    "-DLIBDEFLATE_BUILD_SHARED_LIB=ON",
                    "-DLIBDEFLATE_BUILD_STATIC_LIB=ON",
                    "-DLIBDEFLATE_BUILD_GZIP=ON",
                    "-DLIBDEFLATE_BUILD_TESTS=OFF",
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
        bins = { "libdeflate-gzip", "libdeflate-gunzip" },
        checks = {
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && yes libdeflate | head -c 65536 > $d/in && libdeflate-gzip -c $d/in > $d/in.gz && libdeflate-gunzip -c $d/in.gz > $d/out && cmp $d/in $d/out && test -s $d/in.gz && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.26",
        },
        ["aarch64-macos"] = {
            default_version = "1.26",
        },
        ["x86_64-linux"] = {
            default_version = "1.26",
        },
    },
    versions = {
        ["1.26"] = {
            digests = {
                ["aarch64-linux"] = "125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a",
                ["aarch64-macos"] = "125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a",
                ["x86_64-linux"] = "125856d4656e0feab660f94842f835923410c9281fedbcee64598c918da42b5a",
            },
        },
    },
}
