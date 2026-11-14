return {
    name = "openjpeg",
    description = "JPEG 2000 codec library and tools",
    homepage = "https://www.openjpeg.org/",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause",
    upstream = {
        github = "uclouvain/openjpeg",
        repository_id = 30830585,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/uclouvain/openjpeg/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "openjpeg-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libopenjp2.a", "lib/libopenjp2.{shared_extension}" },
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
                    "-DBUILD_STATIC_LIBS=ON",
                    "-DBUILD_CODEC=ON",
                    "-DBUILD_DOC=OFF",
                    "-DBUILD_TESTING=OFF",
                    "-DBUILD_THIRDPARTY=OFF",
                    "-DCMAKE_DISABLE_FIND_PACKAGE_PNG=ON",
                    "-DCMAKE_DISABLE_FIND_PACKAGE_TIFF=ON",
                    "-DCMAKE_DISABLE_FIND_PACKAGE_LCMS2=ON",
                    "-DCMAKE_DISABLE_FIND_PACKAGE_ZLIB=ON",
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
        bins = { "opj_compress", "opj_decompress", "opj_dump" },
        checks = {
            {
                "sh",
                "-c",
                'd=$(mktemp -d) && printf "P5\\n64 64\\n255\\n" > $d/in.pgm && head -c 4096 /dev/zero >> $d/in.pgm && opj_compress -i $d/in.pgm -o $d/out.j2k >/dev/null 2>&1 && opj_decompress -i $d/out.j2k -o $d/back.pgm >/dev/null 2>&1 && opj_dump -i $d/out.j2k >/dev/null 2>&1 && test -s $d/back.pgm && echo ok',
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.5.4",
        },
        ["aarch64-macos"] = {
            default_version = "2.5.4",
        },
        ["x86_64-linux"] = {
            default_version = "2.5.4",
        },
    },
    versions = {
        ["2.5.4"] = {
            digests = {
                ["aarch64-linux"] = "a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a",
                ["aarch64-macos"] = "a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a",
                ["x86_64-linux"] = "a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a",
            },
        },
    },
}
