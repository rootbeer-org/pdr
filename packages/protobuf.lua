return {
    name = "protobuf",
    description = "Protocol Buffers serialization library and compiler",
    homepage = "https://protobuf.dev",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "protocolbuffers/protobuf",
        repository_id = 23357588,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/protocolbuffers/protobuf/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "protobuf-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
            {
                package = "abseil",
                kind = "link",
            },
        },
        libraries = { "lib/libprotobuf.a", "lib/libprotobuf-lite.a", "lib/libprotoc.a" },
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
                    "-DCMAKE_POSITION_INDEPENDENT_CODE=ON",
                    "-Dprotobuf_BUILD_TESTS=OFF",
                    -- The default downloads abseil during configure, which a build can't do.
                    "-Dprotobuf_ABSL_PROVIDER=package",
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
        bins = { "protoc" },
        checks = {
            { "protoc", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
printf 'syntax = "proto3";\nmessage M { int32 x = 1; }\n' > "$d/m.proto"
protoc -I "$d" --cpp_out="$d" "$d/m.proto"
test -s "$d/m.pb.cc"
test -s "$d/m.pb.h"
rm -rf "$d"
printf '%s\n' ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "36.2",
        },
        ["aarch64-macos"] = {
            default_version = "36.2",
        },
        ["x86_64-linux"] = {
            default_version = "36.2",
        },
    },
    versions = {
        ["36.2"] = {
            digests = {
                ["aarch64-linux"] = "7e7eaf580ec77f1a392ff1ab1013c13d3b04a6716f002f697f67f3c1113f0530",
                ["aarch64-macos"] = "7e7eaf580ec77f1a392ff1ab1013c13d3b04a6716f002f697f67f3c1113f0530",
                ["x86_64-linux"] = "7e7eaf580ec77f1a392ff1ab1013c13d3b04a6716f002f697f67f3c1113f0530",
            },
        },
    },
}
