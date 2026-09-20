return {
    schema = 2,
    name = "skaffold",
    description = "Build and deploy applications during Kubernetes development",
    homepage = "https://github.com/GoogleContainerTools/skaffold",
    default_version = "2.25.0",
    upstream = {
        github = "GoogleContainerTools/skaffold",
        repository_id = 118654121,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/GoogleContainerTools/skaffold/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "skaffold-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { skaffold = "./cmd/skaffold" },
            tags = { "timetzdata", "release" },
            variables = { ["github.com/GoogleContainerTools/skaffold/v2/pkg/skaffold/version.version"] = "v{version}" },
            cgo = true,
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "skaffold" },
        checks = {
            { "skaffold", "version" },
        },
    },
    versions = {
        ["2.24.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "a8a5b2f7f291834be1fffff0f2eb1a32245c6279546b2037e0281d62d5607bb5",
                },
            },
        },
        ["2.25.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "23290d3ef180391b9c248e11d15a63d5434c1522597600c843de1316507aa751",
                },
            },
        },
    },
}
