return {
    name = "cosign",
    description = "Sign and verify container images and files",
    homepage = "https://docs.sigstore.dev/cosign/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "sigstore/cosign",
        repository_id = 335952417,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/sigstore/cosign/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cosign-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                cosign = "./cmd/cosign",
            },
            variables = {
                ["sigs.k8s.io/release-utils/version.gitVersion"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "cosign" },
        checks = {
            { "cosign", "version" },
            { "cosign", "verify", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.1.6",
        },
        ["aarch64-macos"] = {
            default_version = "3.1.6",
        },
        ["x86_64-linux"] = {
            default_version = "3.1.6",
        },
    },
    versions = {
        ["3.1.5"] = {
            digests = {
                ["aarch64-linux"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
                ["aarch64-macos"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
                ["x86_64-linux"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
            },
        },
        ["3.1.6"] = {
            digests = {
                ["aarch64-linux"] = "ca0b3030158ab97ba6927c75f0586c3d2449651e95015890351174f6753da88d",
                ["aarch64-macos"] = "ca0b3030158ab97ba6927c75f0586c3d2449651e95015890351174f6753da88d",
                ["x86_64-linux"] = "ca0b3030158ab97ba6927c75f0586c3d2449651e95015890351174f6753da88d",
            },
        },
    },
}
