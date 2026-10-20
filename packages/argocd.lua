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
            default_version = "3.5.5",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.5.5",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.5.5",
        },
    },
    versions = {
        ["3.5.3"] = {
            digests = {
                ["aarch64-linux"] = "bb37e5d62df897ea1610f7c647fdc78657a0e3a928dc21893faf7bf66a4646cb",
                ["aarch64-macos"] = "76efc71c00bc3ffeda5daa277d990e3d89b3628b2440fc7dd38aca79c63b15e0",
                ["x86_64-linux"] = "b860f73f57cbddd993cd446f5236d797c1b1ac8554857b2683d2669f17e765b4",
            },
        },
        ["3.5.5"] = {
            digests = {
                ["aarch64-linux"] = "13f423b9014e212a3e0052b7826e1d6b95ee5ac156f2436fc856f2eb8c827537",
                ["aarch64-macos"] = "e1957a758d727f6e3efcdef44209f6bc0c41b98a77057eec9bb5cac5dbd0667f",
                ["x86_64-linux"] = "c3ddfa606fc3e89ab14f55bda6600b207c355b028f8eaabe69b817a4c4621aba",
            },
        },
    },
}
