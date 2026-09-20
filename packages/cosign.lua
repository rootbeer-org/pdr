return {
    schema = 2,
    name = "cosign",
    description = "Sign and verify container images and files",
    default_version = "3.1.3",
    homepage = "https://github.com/sigstore/cosign",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sigstore/cosign",
        repository_id = 335952417,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sigstore/cosign/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "cosign-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { cosign = "./cmd/cosign" },
            variables = { ["sigs.k8s.io/release-utils/version.gitVersion"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "cosign" },
        checks = { { "cosign", "version" }, { "cosign", "verify", "--help" } },
    },
    versions = {
        ["3.1.3"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "ab8fcb8e0b4c0b8d01aefa37790cdd5ad099366b2efb8636b7a0250915b93362",
                },
            },
        },
    },
}
