return {
    schema = 2,
    name = "kind",
    description = "Run local Kubernetes clusters in containers",
    default_version = "0.33.0",
    homepage = "https://github.com/kubernetes-sigs/kind",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes-sigs/kind",
        repository_id = 148545807,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/kubernetes-sigs/kind/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "kind-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { kind = "." },
        },
    },
    outputs = {
        bins = { "kind" },
        checks = { { "kind", "version" }, { "kind", "create", "--help" } },
    },
    versions = {
        ["0.33.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "8b00b127eb567f30b028cb032d236d990404e9fd83ce7798db7f9c7a305fab34",
                },
            },
        },
    },
}
