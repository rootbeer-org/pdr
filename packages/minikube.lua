return {
    name = "minikube",
    description = "Run Kubernetes locally",
    homepage = "https://github.com/kubernetes/minikube",
    default_license = "Apache-2.0",
    upstream = {
        github = "kubernetes/minikube",
        repository_id = 56353740,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/kubernetes/minikube/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "minikube-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                minikube = "./cmd/minikube",
            },
            tags = { "libvirt_dlopen" },
            variables = {
                ["k8s.io/minikube/pkg/version.isoVersion"] = "v1.39.0",
                ["k8s.io/minikube/pkg/version.storageProvisionerVersion"] = "v5",
                ["k8s.io/minikube/pkg/version.version"] = "v{version}",
            },
            cgo = true,
        },
    },
    outputs = {
        bins = { "minikube" },
        checks = {
            { "minikube", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.39.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.39.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.39.0",
        },
    },
    versions = {
        ["1.39.0"] = {
            digests = {
                ["aarch64-linux"] = "052b5b75f5a714a2d619be69bd9826083b42515d810cf1cac591ef0835be7fd9",
                ["aarch64-macos"] = "052b5b75f5a714a2d619be69bd9826083b42515d810cf1cac591ef0835be7fd9",
                ["x86_64-linux"] = "052b5b75f5a714a2d619be69bd9826083b42515d810cf1cac591ef0835be7fd9",
            },
            revision = 3,
        },
    },
}
