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
            default_version = "3.5.3",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "3.5.3",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "3.5.3",
        },
    },
    versions = {
        ["3.5.2"] = {
            digests = {
                ["aarch64-linux"] = "a8c326658c54b3a287ea25de91a8517fc4768f65ad810d918cb7444e049cea33",
                ["aarch64-macos"] = "6ef581f2d66b3edd178d31705639fa9b58ce820559d83cf78fef50759d821c77",
                ["x86_64-linux"] = "d87058531d2aed735100636dd7664bdd49b862588993b571385c49494f9832c1",
            },
            revision = 2,
        },
        ["3.5.3"] = {
            digests = {
                ["aarch64-linux"] = "bb37e5d62df897ea1610f7c647fdc78657a0e3a928dc21893faf7bf66a4646cb",
                ["aarch64-macos"] = "76efc71c00bc3ffeda5daa277d990e3d89b3628b2440fc7dd38aca79c63b15e0",
                ["x86_64-linux"] = "b860f73f57cbddd993cd446f5236d797c1b1ac8554857b2683d2669f17e765b4",
            },
        },
    },
}
