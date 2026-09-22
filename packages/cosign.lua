return {
    name = "cosign",
    description = "Sign and verify container images and files",
    homepage = "https://github.com/sigstore/cosign",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/sigstore/cosign/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cosign-{version}",
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
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.1.3",
            upstream = { github = "sigstore/cosign", repository_id = 335952417, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "3.1.3",
            upstream = { github = "sigstore/cosign", repository_id = 335952417, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "3.1.3",
            upstream = { github = "sigstore/cosign", repository_id = 335952417, tag_prefix = "v" },
        },
    },
    versions = {
        ["3.1.3"] = {
            digests = {
                ["aarch64-linux"] = "ab8fcb8e0b4c0b8d01aefa37790cdd5ad099366b2efb8636b7a0250915b93362",
                ["aarch64-macos"] = "ab8fcb8e0b4c0b8d01aefa37790cdd5ad099366b2efb8636b7a0250915b93362",
                ["x86_64-linux"] = "ab8fcb8e0b4c0b8d01aefa37790cdd5ad099366b2efb8636b7a0250915b93362",
            },
            revision = 3,
        },
    },
}
