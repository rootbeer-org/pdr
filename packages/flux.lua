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
            default_version = "2.10.0",
        },
        ["aarch64-macos"] = {
            target = "darwin_arm64",
            default_version = "2.10.0",
        },
        ["x86_64-linux"] = {
            target = "linux_amd64",
            default_version = "2.10.0",
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
        ["2.9.6"] = {
            digests = {
                ["aarch64-linux"] = "6663c154755b732f43dc993d72321f71c2fc1ff0bcb94b2696e0a8638fa562b4",
                ["aarch64-macos"] = "7008a758da4b8d57c5845aad6552f256d4d23630c2b2de2ca8da362f9a48c126",
                ["x86_64-linux"] = "b4d22673e9246cbd628881f1a9ef3b090085dced291e42d804555cee8e8d42c5",
            },
        },
    },
}
