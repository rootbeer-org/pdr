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
            default_version = "1.27.2",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "1.27.2",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.27.2",
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
        ["1.27.2"] = {
            digests = {
                ["aarch64-linux"] = "94f3e30b8e374bc285e7dadc11e0865726b9bc6e85b841ccceaabc0214c6b7c8",
                ["aarch64-macos"] = "76812b213b1b2302c978d28fa52fa92d541704b9e7d9d5db8002c50e4018c4c5",
                ["x86_64-linux"] = "ecbadb99091a3f46e31f5f934b068b1864eafa7995211b39eaddf76996045fe5",
            },
        },
    },
}
