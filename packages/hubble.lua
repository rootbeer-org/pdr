return {
    name = "hubble",
    description = "Inspect Kubernetes network traffic with Cilium",
    homepage = "https://github.com/cilium/hubble",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "cilium/hubble",
        repository_id = 222612062,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/cilium/hubble/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "hubble-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                hubble = ".",
            },
            variables = {
                ["github.com/cilium/cilium/hubble/pkg.Version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "hubble" },
        checks = {
            { "hubble", "version" },
            { "hubble", "observe", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.19.4",
        },
        ["aarch64-macos"] = {
            default_version = "1.19.4",
        },
        ["x86_64-linux"] = {
            default_version = "1.19.4",
        },
    },
    versions = {
        ["1.19.4"] = {
            digests = {
                ["aarch64-linux"] = "82e8d062e8f2cfeecaeda19f300350d6b453d6d1584f2111f6a7763722994366",
                ["aarch64-macos"] = "82e8d062e8f2cfeecaeda19f300350d6b453d6d1584f2111f6a7763722994366",
                ["x86_64-linux"] = "82e8d062e8f2cfeecaeda19f300350d6b453d6d1584f2111f6a7763722994366",
            },
            revision = 3,
        },
    },
}
