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
            default_version = "2.9.6",
        },
        ["aarch64-macos"] = {
            target = "darwin_arm64",
            default_version = "2.9.6",
        },
        ["x86_64-linux"] = {
            target = "linux_amd64",
            default_version = "2.9.6",
        },
    },
    versions = {
        ["2.9.5"] = {
            digests = {
                ["aarch64-linux"] = "f3e159af616ec0b9bd0a405c2185cf09d06b74652c1de3c7f377e8166826651a",
                ["aarch64-macos"] = "2869ef7151a6f1b27e6b5d2a6804f3ef23c7bdaa06a74e00d3fe5bfc646547fd",
                ["x86_64-linux"] = "b853df82adfd7736f580692f9f734473d571606307139f8fd20c2a80dd1ff473",
            },
            revision = 2,
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
