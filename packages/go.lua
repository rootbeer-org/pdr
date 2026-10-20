return {
    name = "go",
    description = "Build software with the Go toolchain",
    homepage = "https://go.dev",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        git = "https://go.googlesource.com/go",
        tag = "go{version}",
    },
    prebuilt = {
        url = "https://go.dev/dl/go{version}.{target}.tar.gz",
        install = {
            Archive = {
                format = "TarGz",
                strip_prefix = "go",
            },
        },
        steps = {
            install = {
                {
                    "sh",
                    "-c",
                    "rm -rf lib/time/update.bash src/*.bash src/*.rc src/cmd/vendor/golang.org/x/sys/windows/*.bash src/cmd/vendor/golang.org/x/tools/internal/diff/lcs/git.sh src/crypto/internal/boring/*.sh src/debug/elf/testdata/libtiffxx.so_ src/go/doc/comment/mkstd.sh src/regexp/syntax/make_perl_groups.pl src/runtime/race/mkcgo.sh src/simd/archsimd/_gen/simdgen/etetest.sh",
                },
            },
        },
    },
    outputs = {
        bins = {
            go = "bin/go",
            gofmt = "bin/gofmt",
        },
        checks = {
            { "go", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "1.27.3",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.27.3",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.27.3",
        },
    },
    versions = {
        ["1.27.1"] = {
            digests = {
                ["aarch64-linux"] = "3450b45a3f9ee8568792736a5c5e70a1f2e9b36c35a8f74958c03e51d7d92bec",
                ["aarch64-macos"] = "ee215d57e0ec269c60cc9ceca68e6bda321ba9ee5afe24f4b0988703c2d87d12",
                ["x86_64-linux"] = "63d339f0da5ab53635a56f2490a7984dfe12dfcff22ad749f63edaf590168445",
            },
        },
        ["1.27.3"] = {
            digests = {
                ["aarch64-linux"] = "a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49",
                ["aarch64-macos"] = "dd3908cf20959d798c1e06ebe5b72213f0505ce01373b40ce3110975a6cd99c2",
                ["x86_64-linux"] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40",
            },
        },
    },
}
