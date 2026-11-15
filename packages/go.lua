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
            default_version = "1.27.4",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.27.4",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.27.4",
        },
    },
    versions = {
        ["1.27.3"] = {
            digests = {
                ["aarch64-linux"] = "a06e99309dbcbdca1a8ccd2282c3ee146e55930886e26b4f1193269587165f49",
                ["aarch64-macos"] = "dd3908cf20959d798c1e06ebe5b72213f0505ce01373b40ce3110975a6cd99c2",
                ["x86_64-linux"] = "65efbc80fdc1fa2cd2631cad5b481777a68e8725f34e89f50fc6ac714e379b40",
            },
        },
        ["1.27.4"] = {
            digests = {
                ["aarch64-linux"] = "3392582988a273a87ab5043ee1b2c9c17a2c3c00580bf9326c47a2e0aaaeac92",
                ["aarch64-macos"] = "91a44a2b8a716600ad94a4f143e156116620db8828086a6e3602291be9bd0bb4",
                ["x86_64-linux"] = "7226736c2339719cda28fbf3a54d71aa63bcefe376e98cef00034268dab24840",
            },
        },
    },
}
