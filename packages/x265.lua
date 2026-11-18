return {
    name = "x265",
    description = "H.265/HEVC video encoder library and CLI",
    homepage = "https://www.videolan.org/developers/x265.html",
    recipe_maintainers = { "tale" },
    default_license = "GPL-2.0-or-later",
    upstream = {
        git = "https://bitbucket.org/multicoreware/x265_git.git",
        tag = "{version}",
    },
    source = {
        url = "https://bitbucket.org/multicoreware/x265_git/downloads/x265_{version}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "x265_{version}",
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
            "lib/libx265.a",
            "lib/libx265.{shared_extension}",
        },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    "source",
                    "-B",
                    "x265-build",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_LIBDIR=lib",
                    "-DCMAKE_INSTALL_INCLUDEDIR=include",
                    "-DCMAKE_INSTALL_BINDIR=bin",
                    "-DCMAKE_INSTALL_NAME_DIR={prefix}/lib",
                    "-DENABLE_SHARED=ON",
                    "-DENABLE_CLI=ON",
                    "-DENABLE_PIC=ON",
                    "-DENABLE_TESTS=OFF",
                },
            },
            build = {
                { "cmake", "--build", "x265-build", "--parallel", "{jobs}" },
            },
            install = {
                { "cmake", "--install", "x265-build" },
            },
        },
    },
    outputs = {
        bins = { "x265" },
        -- glibc's vector math library, present on every glibc system; the
        -- -ffast-math auto-vectorized loops in libx265 call into it.
        host = { "libmvec.so.1" },
        checks = {
            { "x265", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
head -c 12288 /dev/zero > $d/in.yuv
x265 --input-res 64x64 --fps 25 --input $d/in.yuv -o $d/out.hevc >/dev/null 2>&1
test -s $d/out.hevc
echo ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.2",
        },
        ["aarch64-macos"] = {
            default_version = "4.2",
        },
        ["x86_64-linux"] = {
            default_version = "4.2",
        },
    },
    versions = {
        ["4.2"] = {
            digests = {
                ["aarch64-linux"] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210",
                ["aarch64-macos"] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210",
                ["x86_64-linux"] = "40b1ea0453e0309f0eba934e0ddf533f8f6295966679e8894e8f1c1c8d5e1210",
            },
        },
    },
}
