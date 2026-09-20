return {
    schema = 2,
    name = "minikube",
    description = "Run Kubernetes locally",
    default_version = "1.39.0",
    homepage = "https://github.com/kubernetes/minikube",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "kubernetes/minikube",
        repository_id = 56353740,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/kubernetes/minikube/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "minikube-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { minikube = "./cmd/minikube" },
            tags = { "libvirt_dlopen" },
            variables = {
                ["k8s.io/minikube/pkg/version.version"] = "v{version}",
                ["k8s.io/minikube/pkg/version.isoVersion"] = "v1.39.0",
                ["k8s.io/minikube/pkg/version.storageProvisionerVersion"] = "v5",
            },
            cgo = true,
        },
    },
    outputs = {
        bins = { "minikube" },
        checks = { { "minikube", "version" } },
    },
    versions = {
        ["1.39.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "052b5b75f5a714a2d619be69bd9826083b42515d810cf1cac591ef0835be7fd9",
                },
            },
        },
    },
}
