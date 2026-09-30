return {
    name = "kubeconform",
    description = "Validate Kubernetes manifests against schemas",
    homepage = "https://github.com/yannh/kubeconform",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "yannh/kubeconform",
        repository_id = 268015482,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/yannh/kubeconform/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "kubeconform-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kubeconform = "./cmd/kubeconform",
            },
            variables = {
                ["main.version"] = "v{version}",
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
        bins = { "kubeconform" },
        checks = {
            { "kubeconform", "-v" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.8.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.8.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.8.0",
        },
    },
    versions = {
        ["0.8.0"] = {
            digests = {
                ["aarch64-linux"] = "c345de9c3207f2d24628c64fe3cb9bed55c4248b12c181efe81ee907d6c994f2",
                ["aarch64-macos"] = "c345de9c3207f2d24628c64fe3cb9bed55c4248b12c181efe81ee907d6c994f2",
                ["x86_64-linux"] = "c345de9c3207f2d24628c64fe3cb9bed55c4248b12c181efe81ee907d6c994f2",
            },
            revision = 2,
        },
    },
}
