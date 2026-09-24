return {
    name = "grpcurl",
    description = "Call gRPC services from the command line",
    homepage = "https://github.com/fullstorydev/grpcurl",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "fullstorydev/grpcurl",
        repository_id = 111431261,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/fullstorydev/grpcurl/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "grpcurl-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                grpcurl = "./cmd/grpcurl",
            },
            variables = {
                ["main.version"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "grpcurl" },
        checks = {
            { "grpcurl", "-version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.9.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.9.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.9.4",
        },
    },
    versions = {
        ["1.9.4"] = {
            digests = {
                ["aarch64-linux"] = "bea899ba2f483a951bf40aa05d41e069dd2f7bfe52d2a229717abfdb5620cb7c",
                ["aarch64-macos"] = "bea899ba2f483a951bf40aa05d41e069dd2f7bfe52d2a229717abfdb5620cb7c",
                ["x86_64-linux"] = "bea899ba2f483a951bf40aa05d41e069dd2f7bfe52d2a229717abfdb5620cb7c",
            },
            revision = 3,
        },
    },
}
