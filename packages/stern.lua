return {
    schema = 2,
    name = "stern",
    description = "Follow logs from multiple Kubernetes pods",
    default_version = "1.34.0",
    homepage = "https://github.com/stern/stern",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "stern/stern",
        repository_id = 306013800,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/stern/stern/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "stern-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { stern = "." },
            variables = { ["github.com/stern/stern/cmd.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "stern" },
        checks = { { "stern", "--version" } },
    },
    versions = {
        ["1.34.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "1cfec22cef9705e68fc46060ba85164af12bd07ede9264bafb67d11400996e71",
                },
            },
        },
    },
}
