return {
    name = "flux",
    description = "Manage GitOps deployments with Flux",
    homepage = "https://github.com/fluxcd/flux2",
    default_license = "Apache-2.0",
    prebuilt = {
        github = "fluxcd/flux2",
        tag = "v{version}",
        asset = "flux_{version}_{target}.tar.gz",
    },
    outputs = { bins = { "flux" }, checks = { { "flux", "version", "--client" } } },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux_arm64",
            default_version = "2.9.5",
            upstream = { github = "fluxcd/flux2", repository_id = 258469100, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "darwin_arm64",
            default_version = "2.9.5",
            upstream = { github = "fluxcd/flux2", repository_id = 258469100, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "linux_amd64",
            default_version = "2.9.5",
            upstream = { github = "fluxcd/flux2", repository_id = 258469100, tag_prefix = "v" },
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
    },
}
