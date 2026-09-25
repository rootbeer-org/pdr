return {
    name = "kubectl",
    description = "Control Kubernetes clusters",
    homepage = "https://kubernetes.io/docs/reference/kubectl/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "kubernetes/kubernetes",
        repository_id = 20580498,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/kubernetes/kubernetes/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "kubernetes-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kubectl = "./cmd/kubectl",
            },
            variables = {
                ["k8s.io/component-base/version.gitCommit"] = "{commit}",
                ["k8s.io/component-base/version.gitMajor"] = "{major}",
                ["k8s.io/component-base/version.gitMinor"] = "{minor}",
                ["k8s.io/component-base/version.gitTreeState"] = "clean",
                ["k8s.io/component-base/version.gitVersion"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "kubectl" },
        checks = {
            { "kubectl", "version", "--client=true" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.37.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.37.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.37.1",
        },
    },
    versions = {
        ["1.37.0"] = {
            digests = {
                ["aarch64-linux"] = "956ddae3b12acc08a715aea0411a168a36d5989b3e7185deeb6bf46b7dac19cf",
                ["aarch64-macos"] = "956ddae3b12acc08a715aea0411a168a36d5989b3e7185deeb6bf46b7dac19cf",
                ["x86_64-linux"] = "956ddae3b12acc08a715aea0411a168a36d5989b3e7185deeb6bf46b7dac19cf",
            },
            commit = "f54c212e3a2f75d674b717a9b29052b20b60aefc",
        },
        ["1.37.1"] = {
            digests = {
                ["aarch64-linux"] = "89295ac375eb0fdfe68a0696d81be615771d6b27c7ad9bb675dc6ffd0d2ce5f3",
                ["aarch64-macos"] = "89295ac375eb0fdfe68a0696d81be615771d6b27c7ad9bb675dc6ffd0d2ce5f3",
                ["x86_64-linux"] = "89295ac375eb0fdfe68a0696d81be615771d6b27c7ad9bb675dc6ffd0d2ce5f3",
            },
            commit = "f78e722310e50bcaca9276be22276d9e91d91308",
        },
    },
}
