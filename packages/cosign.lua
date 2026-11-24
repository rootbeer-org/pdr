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
            default_version = "3.1.5",
        },
        ["aarch64-macos"] = {
            default_version = "3.1.5",
        },
        ["x86_64-linux"] = {
            default_version = "3.1.5",
        },
    },
    versions = {
        ["3.1.4"] = {
            digests = {
                ["aarch64-linux"] = "438339dec811a8352837bc140ca0e987c12e6b6403d4da7ce12cd226fee6c800",
                ["aarch64-macos"] = "438339dec811a8352837bc140ca0e987c12e6b6403d4da7ce12cd226fee6c800",
                ["x86_64-linux"] = "438339dec811a8352837bc140ca0e987c12e6b6403d4da7ce12cd226fee6c800",
            },
        },
        ["3.1.5"] = {
            digests = {
                ["aarch64-linux"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
                ["aarch64-macos"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
                ["x86_64-linux"] = "eab9e35839fd50dd17d128b6c22cb0cf12e6f1e782fe598a321f7dbc467585ce",
            },
        },
    },
}
