return {
    name = "helm",
    description = "Manage Kubernetes applications with charts",
    homepage = "https://helm.sh/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "helm/helm",
        repository_id = 43723161,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/helm/helm/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "helm-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                helm = "./cmd/helm",
            },
            variables = {
                ["helm.sh/helm/v4/internal/version.gitTreeState"] = "clean",
                ["helm.sh/helm/v4/internal/version.version"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "helm" },
        checks = {
            { "helm", "version" },
            { "helm", "create", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.3.0",
        },
        ["aarch64-macos"] = {
            default_version = "4.3.0",
        },
        ["x86_64-linux"] = {
            default_version = "4.3.0",
        },
    },
    versions = {
        ["4.3.0"] = {
            digests = {
                ["aarch64-linux"] = "c9c930efa3abf03c331da421db81d61fb942218c7a7b80a8c0f0132d79fb5f62",
                ["aarch64-macos"] = "c9c930efa3abf03c331da421db81d61fb942218c7a7b80a8c0f0132d79fb5f62",
                ["x86_64-linux"] = "c9c930efa3abf03c331da421db81d61fb942218c7a7b80a8c0f0132d79fb5f62",
            },
            revision = 2,
        },
    },
}
