return {
    name = "flux",
    aliases = { "fluxcd" },
    description = "Manage Kubernetes deployments with GitOps",
    homepage = "https://fluxcd.io/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "fluxcd/flux2",
        repository_id = 258469100,
        tag = "v{version}",
    },
    prebuilt = {
        github = "fluxcd/flux2",
        tag = "v{version}",
        asset = "flux_{version}_{target}.tar.gz",
    },
    outputs = {
        bins = { "flux" },
        checks = {
            { "flux", "version", "--client" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux_arm64",
            default_version = "2.10.1",
        },
        ["aarch64-macos"] = {
            target = "darwin_arm64",
            default_version = "2.10.1",
        },
        ["x86_64-linux"] = {
            target = "linux_amd64",
            default_version = "2.10.1",
        },
    },
    versions = {
        ["2.10.0"] = {
            digests = {
                ["aarch64-linux"] = "c3c435052e5e18156858bc73f26bcadb62821a6e30951b4b302beb4e65a532c2",
                ["aarch64-macos"] = "339c5dba218e2b0a04a0841d1dace6c00d65736dc3286038463fa86754ff6c53",
                ["x86_64-linux"] = "208dd7012c04fedeed5b2d0b6e63df3b15b1c34a381527811685c098bc9f8659",
            },
        },
        ["2.10.1"] = {
            digests = {
                ["aarch64-linux"] = "da18ddb25c9614405d9e2f13ad014fd660bfcbe7218674cabf9325db73f811e2",
                ["aarch64-macos"] = "c0a8dc285c568905ae38e25074985f3181c82a3c8d66316959561f27a626909d",
                ["x86_64-linux"] = "967365ff84aabc97871827ff33713ef0c09f62dd83c18759e3a5e39adcea9285",
            },
        },
    },
}
