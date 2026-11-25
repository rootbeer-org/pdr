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
        dependencies = {
            {
                package = "go",
                kind = "build",
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
            default_version = "1.37.3",
        },
        ["aarch64-macos"] = {
            default_version = "1.37.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.37.3",
        },
    },
    versions = {
        ["1.37.2"] = {
            digests = {
                ["aarch64-linux"] = "6b1a4921ce0249a4607528e2b4f211c6aaeb2f03204bcabefabb3f6742ba67b8",
                ["aarch64-macos"] = "6b1a4921ce0249a4607528e2b4f211c6aaeb2f03204bcabefabb3f6742ba67b8",
                ["x86_64-linux"] = "6b1a4921ce0249a4607528e2b4f211c6aaeb2f03204bcabefabb3f6742ba67b8",
            },
            commit = "c50e5395f1ae2d4a2c05f28fdcc38c0916cc1a32",
        },
        ["1.37.3"] = {
            digests = {
                ["aarch64-linux"] = "e855a5151a209537df57e10c13eb07ab164e2fc50137a6649e99e5366bc0bb57",
                ["aarch64-macos"] = "e855a5151a209537df57e10c13eb07ab164e2fc50137a6649e99e5366bc0bb57",
                ["x86_64-linux"] = "e855a5151a209537df57e10c13eb07ab164e2fc50137a6649e99e5366bc0bb57",
            },
            commit = "f81a9c5f95912fd97b7c8aa4966301aeae84a253",
        },
    },
}
