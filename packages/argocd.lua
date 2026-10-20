return {
    name = "argocd",
    description = "Manage Argo CD applications and deployments",
    homepage = "https://argo-cd.readthedocs.io",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "argoproj/argo-cd",
        repository_id = 120896210,
        tag = "v{version}",
    },
    prebuilt = {
        github = "argoproj/argo-cd",
        tag = "v{version}",
        asset = "argocd-{target}",
    },
    outputs = {
        bins = { "argocd" },
        checks = {
            { "argocd", "version", "--client", "--short" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "3.5.6",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.5.6",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.5.6",
        },
    },
    versions = {
        ["3.5.5"] = {
            digests = {
                ["aarch64-linux"] = "13f423b9014e212a3e0052b7826e1d6b95ee5ac156f2436fc856f2eb8c827537",
                ["aarch64-macos"] = "e1957a758d727f6e3efcdef44209f6bc0c41b98a77057eec9bb5cac5dbd0667f",
                ["x86_64-linux"] = "c3ddfa606fc3e89ab14f55bda6600b207c355b028f8eaabe69b817a4c4621aba",
            },
        },
        ["3.5.6"] = {
            digests = {
                ["aarch64-linux"] = "281aea75a1eaea15e2839f12626e78684f76099f09ffb0b05d35f64344ed1256",
                ["aarch64-macos"] = "55dc94ed2f1e827090a0a32962e181bedcbd3a8277b4fc95de955366f465cc5e",
                ["x86_64-linux"] = "db9d17b70593d3f86a4dcf08d9ebbb85a42e995426ac5f928b737260656102d3",
            },
        },
    },
}
