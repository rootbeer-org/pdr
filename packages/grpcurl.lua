return {
    schema = 2,
    name = "grpcurl",
    description = "Call gRPC services from the command line",
    default_version = "1.9.4",
    homepage = "https://github.com/fullstorydev/grpcurl",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "fullstorydev/grpcurl",
        repository_id = 111431261,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/fullstorydev/grpcurl/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "grpcurl-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { grpcurl = "./cmd/grpcurl" },
            variables = { ["main.version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "grpcurl" },
        checks = { { "grpcurl", "-version" } },
    },
    versions = {
        ["1.9.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "bea899ba2f483a951bf40aa05d41e069dd2f7bfe52d2a229717abfdb5620cb7c",
                },
            },
        },
    },
}
