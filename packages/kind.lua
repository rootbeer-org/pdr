return {
    name = "kind",
    description = "Run local Kubernetes clusters in containers",
    homepage = "https://github.com/kubernetes-sigs/kind",
    default_license = "Apache-2.0",
    upstream = {
        github = "kubernetes-sigs/kind",
        repository_id = 148545807,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/kubernetes-sigs/kind/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "kind-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kind = ".",
            },
        },
    },
    outputs = {
        bins = { "kind" },
        checks = {
            { "kind", "version" },
            { "kind", "create", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.33.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.33.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.33.0",
        },
    },
    versions = {
        ["0.33.0"] = {
            digests = {
                ["aarch64-linux"] = "8b00b127eb567f30b028cb032d236d990404e9fd83ce7798db7f9c7a305fab34",
                ["aarch64-macos"] = "8b00b127eb567f30b028cb032d236d990404e9fd83ce7798db7f9c7a305fab34",
                ["x86_64-linux"] = "8b00b127eb567f30b028cb032d236d990404e9fd83ce7798db7f9c7a305fab34",
            },
            revision = 3,
        },
    },
}
