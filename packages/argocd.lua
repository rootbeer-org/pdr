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
            default_version = "3.6.3",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.6.3",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.6.3",
        },
    },
    versions = {
        ["3.6.2"] = {
            digests = {
                ["aarch64-linux"] = "578e87773bfb0fe5047250f16f914d0362fbfce0b5b2b7ed7204776925dcdff9",
                ["aarch64-macos"] = "188d11670ba0160214d37e6df8a507f9dafd96234bf040d6e82ae1b733660a5a",
                ["x86_64-linux"] = "80cc51ce8eb39d5601d54fd14225ed15a04ccf4baa3427f5c1e72a4e342aa0b2",
            },
        },
        ["3.6.3"] = {
            digests = {
                ["aarch64-linux"] = "04a7b681d6c5eec193159705c5556114f8cba98abada4c17c3991124065e1964",
                ["aarch64-macos"] = "1b45f9805b54375d7b0d18fb646b64dca153b98527443716e07b0aced45ce623",
                ["x86_64-linux"] = "3750cd7ed2a2ef05c640344b86f29aa99c9783e847c8f326c81e3900ad39412b",
            },
        },
    },
}
