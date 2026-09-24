return {
    name = "buf",
    description = "Build and check Protocol Buffer schemas",
    homepage = "https://buf.build/docs/cli/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "bufbuild/buf",
        repository_id = 212465715,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/bufbuild/buf/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "buf-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                buf = "./cmd/buf",
            },
        },
    },
    outputs = {
        bins = { "buf" },
        checks = {
            { "buf", "--version" },
            { "buf", "lint", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.73.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.73.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.73.0",
        },
    },
    versions = {
        ["1.73.0"] = {
            digests = {
                ["aarch64-linux"] = "5b74e94416114ccfcef2692592150a5c8459a9cb6f94088d42341ac06c389a22",
                ["aarch64-macos"] = "5b74e94416114ccfcef2692592150a5c8459a9cb6f94088d42341ac06c389a22",
                ["x86_64-linux"] = "5b74e94416114ccfcef2692592150a5c8459a9cb6f94088d42341ac06c389a22",
            },
            revision = 3,
        },
    },
}
