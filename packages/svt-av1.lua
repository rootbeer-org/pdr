return {
    name = "svt-av1",
    description = "Scalable Video Technology AV1 encoder",
    homepage = "https://gitlab.com/AOMediaCodec/SVT-AV1",
    recipe_maintainers = { "tale" },
    default_license = "BSD-2-Clause-Patent",
    upstream = {
        git = "https://gitlab.com/AOMediaCodec/SVT-AV1.git",
        tag = "v{version}",
    },
    source = {
        url = "https://gitlab.com/AOMediaCodec/SVT-AV1/-/archive/v{version}/SVT-AV1-v{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "SVT-AV1-v{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
            {
                package = "nasm",
                kind = "build",
            },
        },
        libraries = {
            "lib/libSvtAv1Enc.a",
            "lib/libSvtAv1Enc.{shared_extension}",
        },
        steps = {
            -- One cmake target switches on BUILD_SHARED_LIBS, so the static and shared
            -- libraries are two configure/build passes. Static installs first so the
            -- shared pass overwrites the shared headers and app.
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build-static",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DBUILD_SHARED_LIBS=OFF",
                    -- The static library may be linked into other shared libraries.
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    "-DBUILD_APPS=ON",
                    "-DBUILD_TESTING=OFF",
                },
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build-shared",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DBUILD_SHARED_LIBS=ON",
                    "-DBUILD_APPS=ON",
                    "-DBUILD_TESTING=OFF",
                    -- Absolute install name on macOS instead of @rpath.
                    "-DCMAKE_INSTALL_NAME_DIR={prefix}/lib",
                },
            },
            build = {
                { "cmake", "--build", "build-static", "--parallel", "{jobs}" },
                { "cmake", "--build", "build-shared", "--parallel", "{jobs}" },
            },
            install = {
                { "cmake", "--install", "build-static" },
                { "cmake", "--install", "build-shared" },
            },
        },
    },
    outputs = {
        bins = { "SvtAv1EncApp" },
        checks = {
            { "SvtAv1EncApp", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
head -c 12288 /dev/zero > $d/in.yuv
SvtAv1EncApp -i $d/in.yuv -w 64 -h 64 --fps-num 25 --fps-denom 1 -n 2 -b $d/out.ivf >/dev/null 2>&1
test -s $d/out.ivf
echo ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.3.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.3.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.3.0",
        },
    },
    versions = {
        ["4.3.0"] = {
            digests = {
                ["aarch64-linux"] = "95ce8fc2381ba707e65ac8b9b2e165915bfbe9cd4d2f7b0f58d64ce31bd98f6d",
                ["aarch64-macos"] = "95ce8fc2381ba707e65ac8b9b2e165915bfbe9cd4d2f7b0f58d64ce31bd98f6d",
                ["x86_64-linux"] = "95ce8fc2381ba707e65ac8b9b2e165915bfbe9cd4d2f7b0f58d64ce31bd98f6d",
            },
        },
    },
}
