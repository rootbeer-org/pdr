return {
    name = "kvazaar",
    description = "Open-source H.265/HEVC video encoder library",
    homepage = "https://github.com/ultravideo/kvazaar",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "ultravideo/kvazaar",
        repository_id = 16339396,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/ultravideo/kvazaar/releases/download/v{version}/kvazaar-{version}.tar.xz",
        archive = "tar.xz",
        strip_prefix = "kvazaar-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "all",
            },
        },
        libraries = { "lib/libkvazaar.{shared_extension}" },
        steps = {
            -- The cmake build has no yasm dependency and no x86 asm; SIMD is intrinsics only.
            -- Upstream adds the relative run-paths lib, ./ and ../lib, which the scan can't resolve.
            prepare = {
                {
                    "/bin/sh",
                    "-c",
                    "grep -v 'APPEND CMAKE_INSTALL_RPATH' CMakeLists.txt > CMakeLists.txt.new && mv CMakeLists.txt.new CMakeLists.txt",
                },
            },
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
                    "-DBUILD_TESTS=OFF",
                    "-DBUILD_KVAZAAR_BINARY=ON",
                    "-DUSE_CRYPTO=OFF",
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
        bins = { "kvazaar" },
        checks = {
            { "kvazaar", "--version" },
            {
                "sh",
                "-c",
                "d=$(mktemp -d) && head -c 98304 /dev/zero > $d/in.yuv && kvazaar -i $d/in.yuv --input-res 64x64 -n 2 -o $d/out.hevc >/dev/null 2>&1 && test -s $d/out.hevc && echo ok",
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.3.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.3.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.3.2",
        },
    },
    versions = {
        ["2.3.2"] = {
            digests = {
                ["aarch64-linux"] = "35e506a6d2be9ae343f17787eb80fa214492b276e9c88b6e93749050ae380070",
                ["aarch64-macos"] = "35e506a6d2be9ae343f17787eb80fa214492b276e9c88b6e93749050ae380070",
                ["x86_64-linux"] = "35e506a6d2be9ae343f17787eb80fa214492b276e9c88b6e93749050ae380070",
            },
        },
    },
}
