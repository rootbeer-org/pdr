return {
    name = "skaffold",
    description = "Build and deploy applications during Kubernetes development",
    homepage = "https://github.com/GoogleContainerTools/skaffold",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/GoogleContainerTools/skaffold/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "skaffold-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { skaffold = "./cmd/skaffold" },
            cgo = true,
            tags = { "timetzdata", "release" },
            variables = {
                ["github.com/GoogleContainerTools/skaffold/v2/pkg/skaffold/version.version"] = "v{version}",
            },
        },
    },
    outputs = { bins = { "skaffold" }, checks = { { "skaffold", "version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.25.0",
            upstream = {
                github = "GoogleContainerTools/skaffold",
                repository_id = 118654121,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "2.25.0",
            upstream = {
                github = "GoogleContainerTools/skaffold",
                repository_id = 118654121,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "2.25.0",
            upstream = {
                github = "GoogleContainerTools/skaffold",
                repository_id = 118654121,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["2.24.0"] = {
            digests = {
                ["aarch64-linux"] = "a8a5b2f7f291834be1fffff0f2eb1a32245c6279546b2037e0281d62d5607bb5",
                ["aarch64-macos"] = "a8a5b2f7f291834be1fffff0f2eb1a32245c6279546b2037e0281d62d5607bb5",
                ["x86_64-linux"] = "a8a5b2f7f291834be1fffff0f2eb1a32245c6279546b2037e0281d62d5607bb5",
            },
            revision = 3,
        },
        ["2.25.0"] = {
            digests = {
                ["aarch64-linux"] = "23290d3ef180391b9c248e11d15a63d5434c1522597600c843de1316507aa751",
                ["aarch64-macos"] = "23290d3ef180391b9c248e11d15a63d5434c1522597600c843de1316507aa751",
                ["x86_64-linux"] = "23290d3ef180391b9c248e11d15a63d5434c1522597600c843de1316507aa751",
            },
            revision = 2,
        },
    },
}
