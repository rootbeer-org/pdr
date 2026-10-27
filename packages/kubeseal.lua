return {
    name = "kubeseal",
    description = "Encrypt Kubernetes secrets for Sealed Secrets",
    homepage = "https://github.com/bitnami-labs/sealed-secrets",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "bitnami/sealed-secrets",
        repository_id = 92702519,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/bitnami-labs/sealed-secrets/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "sealed-secrets-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kubeseal = "./cmd/kubeseal",
            },
            variables = {
                ["main.VERSION"] = "{version}",
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
        bins = { "kubeseal" },
        checks = {
            { "kubeseal", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.41.2",
        },
        ["aarch64-macos"] = {
            default_version = "0.41.2",
        },
        ["x86_64-linux"] = {
            default_version = "0.41.2",
        },
    },
    versions = {
        ["0.41.1"] = {
            digests = {
                ["aarch64-linux"] = "40b74c52831206404adcc88a1f078c00e77064cbf3815d2cd234ee5f2cde4ad5",
                ["aarch64-macos"] = "40b74c52831206404adcc88a1f078c00e77064cbf3815d2cd234ee5f2cde4ad5",
                ["x86_64-linux"] = "40b74c52831206404adcc88a1f078c00e77064cbf3815d2cd234ee5f2cde4ad5",
            },
        },
        ["0.41.2"] = {
            digests = {
                ["aarch64-linux"] = "bed6baabc691745a851a89b58e9c3cbeb1981e3ca32d596826143590e9862caa",
                ["aarch64-macos"] = "bed6baabc691745a851a89b58e9c3cbeb1981e3ca32d596826143590e9862caa",
                ["x86_64-linux"] = "bed6baabc691745a851a89b58e9c3cbeb1981e3ca32d596826143590e9862caa",
            },
        },
    },
}
