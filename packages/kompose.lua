return {
    name = "kompose",
    description = "Convert Docker Compose files to Kubernetes resources",
    homepage = "https://github.com/kubernetes/kompose",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/kubernetes/kompose/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "kompose-{version}",
    },
    build = { backend = "go", go = { binaries = { kompose = "." } } },
    outputs = {
        bins = { "kompose" },
        checks = { { "kompose", "version" }, { "kompose", "convert", "--help" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.38.0",
            upstream = { github = "kubernetes/kompose", repository_id = 62088377, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "1.38.0",
            upstream = { github = "kubernetes/kompose", repository_id = 62088377, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "1.38.0",
            upstream = { github = "kubernetes/kompose", repository_id = 62088377, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.38.0"] = {
            digests = {
                ["aarch64-linux"] = "1a6eb3e9a5084d0ce6d1a81628b314686b7cfa41124bace13eb188865f7640a0",
                ["aarch64-macos"] = "1a6eb3e9a5084d0ce6d1a81628b314686b7cfa41124bace13eb188865f7640a0",
                ["x86_64-linux"] = "1a6eb3e9a5084d0ce6d1a81628b314686b7cfa41124bace13eb188865f7640a0",
            },
            revision = 3,
        },
    },
}
