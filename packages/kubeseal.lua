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
                version = "1.27.1",
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
            default_version = "0.40.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.40.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.40.0",
        },
    },
    versions = {
        ["0.40.0"] = {
            digests = {
                ["aarch64-linux"] = "d80d44401f3516d2b31c3e51dcd0826ad8ae90d976c2e86010be2c665ff23d99",
                ["aarch64-macos"] = "d80d44401f3516d2b31c3e51dcd0826ad8ae90d976c2e86010be2c665ff23d99",
                ["x86_64-linux"] = "d80d44401f3516d2b31c3e51dcd0826ad8ae90d976c2e86010be2c665ff23d99",
            },
            revision = 2,
        },
    },
}
