return {
    schema = 2,
    name = "kubectl",
    description = "Control Kubernetes clusters",
    homepage = "https://kubernetes.io/docs/reference/kubectl/",
    default_version = "1.37.0",
    upstream = {
        github = "kubernetes/kubernetes",
        repository_id = 20580498,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/kubernetes/kubernetes/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "kubernetes-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kubectl = "./cmd/kubectl",
            },
            variables = {
                ["k8s.io/component-base/version.gitVersion"] = "v{version}",
                ["k8s.io/component-base/version.gitMajor"] = "1",
                ["k8s.io/component-base/version.gitMinor"] = "37",
                ["k8s.io/component-base/version.gitCommit"] = "f54c212e3a2f75d674b717a9b29052b20b60aefc",
                ["k8s.io/component-base/version.gitTreeState"] = "clean",
            },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "kubectl" },
        checks = {
            { "kubectl", "version", "--client=true" },
        },
    },
    versions = {
        ["1.37.0"] = {
            inputs = {
                source = {
                    sha256 = "956ddae3b12acc08a715aea0411a168a36d5989b3e7185deeb6bf46b7dac19cf",
                },
            },
        },
    },
}
