return {
    name = "krew",
    description = "Install and manage kubectl plugins",
    homepage = "https://krew.sigs.k8s.io",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "kubernetes-sigs/krew",
        repository_id = 140747457,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/kubernetes-sigs/krew/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "krew-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                ["kubectl-krew"] = "./cmd/krew",
            },
            tags = { "netgo" },
            variables = {
                ["sigs.k8s.io/krew/internal/version.gitCommit"] = "{commit}",
                ["sigs.k8s.io/krew/internal/version.gitTag"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "kubectl-krew" },
        checks = {
            { "kubectl-krew", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.5.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.5.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.5.0",
        },
    },
    versions = {
        ["0.5.0"] = {
            digests = {
                ["aarch64-linux"] = "2a9a751d63f67dfc21998774ec9cccf19aa5f1a22596f43226e211578f9f6469",
                ["aarch64-macos"] = "2a9a751d63f67dfc21998774ec9cccf19aa5f1a22596f43226e211578f9f6469",
                ["x86_64-linux"] = "2a9a751d63f67dfc21998774ec9cccf19aa5f1a22596f43226e211578f9f6469",
            },
            commit = "8a4a6fffb08d2ee04b4b013253160a50ed22139c",
            revision = 2,
        },
    },
}
