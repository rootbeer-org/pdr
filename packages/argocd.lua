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
            default_version = "3.6.2",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.6.2",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.6.2",
        },
    },
    versions = {
        ["3.6.1"] = {
            digests = {
                ["aarch64-linux"] = "6636e9183de7dba666b673a417986e7ff54dbadd948b2f9f6c83bcf7d33ebb94",
                ["aarch64-macos"] = "2e4a88082bfcb25dd56369ed9fe807d941ce1d916efb5a080eea6ac00347dfdf",
                ["x86_64-linux"] = "46d2fc941071f0a0c36326a67a431d34b1479e1a24737f7b367abc93968beadc",
            },
        },
        ["3.6.2"] = {
            digests = {
                ["aarch64-linux"] = "578e87773bfb0fe5047250f16f914d0362fbfce0b5b2b7ed7204776925dcdff9",
                ["aarch64-macos"] = "188d11670ba0160214d37e6df8a507f9dafd96234bf040d6e82ae1b733660a5a",
                ["x86_64-linux"] = "80cc51ce8eb39d5601d54fd14225ed15a04ccf4baa3427f5c1e72a4e342aa0b2",
            },
        },
    },
}
