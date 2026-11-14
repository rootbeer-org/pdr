return {
    name = "aom",
    description = "AV1 video codec library (reference encoder and decoder)",
    homepage = "https://aomedia.googlesource.com/aom",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        git = "https://aomedia.googlesource.com/aom",
        tag = "v{version}",
        exclude_tags = { "v*rc*" },
    },
    source = {
        url = "https://storage.googleapis.com/aom-releases/libaom-{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "libaom-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = {
            "lib/libaom.{shared_extension}",
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
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DENABLE_DOCS=OFF",
                    "-DENABLE_EXAMPLES=OFF",
                    "-DENABLE_TESTS=OFF",
                    "-DENABLE_TESTDATA=OFF",
                    "-DENABLE_TOOLS=OFF",
                    "-DCONFIG_AV1_ENCODER=1",
                    "-DCONFIG_AV1_DECODER=1",
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
            default_version = "3.15.3",
        },
        ["aarch64-macos"] = {
            default_version = "3.15.3",
        },
        ["x86_64-linux"] = {
            default_version = "3.15.3",
        },
    },
    versions = {
        ["3.15.3"] = {
            digests = {
                ["aarch64-linux"] = "12c01dc731ed7b5a999e28120b45bf58a002ba3435a4ba2cfbc1e084a27c9c04",
                ["aarch64-macos"] = "12c01dc731ed7b5a999e28120b45bf58a002ba3435a4ba2cfbc1e084a27c9c04",
                ["x86_64-linux"] = "12c01dc731ed7b5a999e28120b45bf58a002ba3435a4ba2cfbc1e084a27c9c04",
            },
        },
    },
}
