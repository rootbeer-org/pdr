return {
    name = "kubectx",
    description = "Switch between Kubernetes contexts and namespaces",
    homepage = "https://github.com/ahmetb/kubectx",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "ahmetb/kubectx",
        repository_id = 86733463,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/ahmetb/kubectx/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "kubectx-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                kubectx = "./cmd/kubectx",
                kubens = "./cmd/kubens",
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
        bins = { "kubectx", "kubens" },
        checks = {
            { "kubectx", "--version" },
            { "kubens", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.11.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.11.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.11.0",
        },
    },
    versions = {
        ["0.11.0"] = {
            digests = {
                ["aarch64-linux"] = "1c8eb6b30c0067f89e5b2f9480865b0e3229a221fadddb644ce192d663c63907",
                ["aarch64-macos"] = "1c8eb6b30c0067f89e5b2f9480865b0e3229a221fadddb644ce192d663c63907",
                ["x86_64-linux"] = "1c8eb6b30c0067f89e5b2f9480865b0e3229a221fadddb644ce192d663c63907",
            },
            revision = 2,
        },
    },
}
