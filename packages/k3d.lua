return {
    name = "k3d",
    description = "Run k3s Kubernetes clusters in Docker",
    homepage = "https://k3d.io",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "k3d-io/k3d",
        repository_id = 179063508,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/k3d-io/k3d/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "k3d-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                k3d = ".",
            },
            variables = {
                ["github.com/k3d-io/k3d/v5/version.Version"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "k3d" },
        checks = {
            { "k3d", "version" },
            { "k3d", "cluster", "create", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.9.0",
        },
        ["aarch64-macos"] = {
            default_version = "5.9.0",
        },
        ["x86_64-linux"] = {
            default_version = "5.9.0",
        },
    },
    versions = {
        ["5.9.0"] = {
            digests = {
                ["aarch64-linux"] = "969cce82c4871bb829be798655abe2b6709b77cc0f42f7ff69293c621dfbbab0",
                ["aarch64-macos"] = "969cce82c4871bb829be798655abe2b6709b77cc0f42f7ff69293c621dfbbab0",
                ["x86_64-linux"] = "969cce82c4871bb829be798655abe2b6709b77cc0f42f7ff69293c621dfbbab0",
            },
        },
    },
}
