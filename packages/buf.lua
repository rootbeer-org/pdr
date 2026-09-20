return {
    schema = 2,
    name = "buf",
    description = "Build and check Protocol Buffer schemas",
    default_version = "1.73.0",
    homepage = "https://github.com/bufbuild/buf",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "bufbuild/buf",
        repository_id = 212465715,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/bufbuild/buf/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "buf-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { buf = "./cmd/buf" },
        },
    },
    outputs = {
        bins = { "buf" },
        checks = { { "buf", "--version" }, { "buf", "lint", "--help" } },
    },
    versions = {
        ["1.73.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "5b74e94416114ccfcef2692592150a5c8459a9cb6f94088d42341ac06c389a22",
                },
            },
        },
    },
}
