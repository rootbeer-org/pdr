return {
    name = "ninja",
    description = "Small build system with a focus on speed",
    homepage = "https://ninja-build.org/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "ninja-build/ninja",
        repository_id = 1335132,
        tag = "v{version}",
    },
    source = {
        url = "https://github.com/ninja-build/ninja/archive/refs/tags/{tag}.tar.gz",
        archive = "tar.gz",
        strip_prefix = "ninja-{version}",
    },
    build = {
        backend = "custom",
        dependencies = {
            {
                package = "cmake",
                kind = "build",
            },
        },
        steps = {
            configure = {
                {
                    "cmake",
                    "-S",
                    ".",
                    "-B",
                    "build",
                    "-DBUILD_TESTING=OFF",
                    "-DCMAKE_BUILD_TYPE=Release",
                    "-DCMAKE_INSTALL_PREFIX={prefix}",
                    "-DCMAKE_INSTALL_BINDIR=bin",
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
        bins = { "ninja" },
        checks = {
            { "ninja", "--version" },
            {
                "sh",
                "-c",
                [[set -e
d=$(mktemp -d)
cd $d
printf 'rule cp\n  command = cp $in $out\nbuild out.txt: cp in.txt\n' > build.ninja
echo hi > in.txt
ninja >/dev/null
test "$(cat out.txt)" = hi
echo ok]],
            },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.13.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.13.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.13.2",
        },
    },
    versions = {
        ["1.13.2"] = {
            digests = {
                ["aarch64-linux"] = "974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17",
                ["aarch64-macos"] = "974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17",
                ["x86_64-linux"] = "974d6b2f4eeefa25625d34da3cb36bdcebe7fbce40f4c16ac0835fd1c0cbae17",
            },
        },
    },
}
