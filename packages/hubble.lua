return {
    schema = 2,
    name = "hubble",
    description = "Inspect Kubernetes network traffic with Cilium",
    default_version = "1.19.4",
    homepage = "https://github.com/cilium/hubble",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "cilium/hubble",
        repository_id = 222612062,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/cilium/hubble/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "hubble-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { hubble = "." },
            variables = { ["github.com/cilium/cilium/hubble/pkg.Version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "hubble" },
        checks = { { "hubble", "version" }, { "hubble", "observe", "--help" } },
    },
    versions = {
        ["1.19.4"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "82e8d062e8f2cfeecaeda19f300350d6b453d6d1584f2111f6a7763722994366",
                },
            },
        },
    },
}
