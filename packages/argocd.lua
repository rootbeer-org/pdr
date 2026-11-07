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
            default_version = "3.6.1",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.6.1",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.6.1",
        },
    },
    versions = {
        ["3.5.6"] = {
            digests = {
                ["aarch64-linux"] = "281aea75a1eaea15e2839f12626e78684f76099f09ffb0b05d35f64344ed1256",
                ["aarch64-macos"] = "55dc94ed2f1e827090a0a32962e181bedcbd3a8277b4fc95de955366f465cc5e",
                ["x86_64-linux"] = "db9d17b70593d3f86a4dcf08d9ebbb85a42e995426ac5f928b737260656102d3",
            },
        },
        ["3.6.1"] = {
            digests = {
                ["aarch64-linux"] = "6636e9183de7dba666b673a417986e7ff54dbadd948b2f9f6c83bcf7d33ebb94",
                ["aarch64-macos"] = "2e4a88082bfcb25dd56369ed9fe807d941ce1d916efb5a080eea6ac00347dfdf",
                ["x86_64-linux"] = "46d2fc941071f0a0c36326a67a431d34b1479e1a24737f7b367abc93968beadc",
            },
        },
    },
}
