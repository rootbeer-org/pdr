return {
    schema = 2,
    name = "kompose",
    description = "Convert Docker Compose files to Kubernetes resources",
    default_version = "1.38.0",
    homepage = "https://github.com/kubernetes/kompose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes/kompose",
        repository_id = 62088377,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/kubernetes/kompose/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "kompose-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { kompose = "." },
        },
    },
    outputs = {
        bins = { "kompose" },
        checks = { { "kompose", "version" }, { "kompose", "convert", "--help" } },
    },
    versions = {
        ["1.38.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "1a6eb3e9a5084d0ce6d1a81628b314686b7cfa41124bace13eb188865f7640a0",
                },
            },
        },
    },
}
