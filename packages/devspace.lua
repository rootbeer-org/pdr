return {
    name = "devspace",
    description = "Develop applications in Kubernetes",
    homepage = "https://github.com/devspace-sh/devspace",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/devspace-sh/devspace/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "devspace-{version}",
    },
    build = {
        backend = "go",
        go = { binaries = { devspace = "." }, variables = { ["main.version"] = "{version}" } },
    },
    outputs = { bins = { "devspace" }, checks = { { "devspace", "version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "6.3.21",
            upstream = {
                github = "devspace-sh/devspace",
                repository_id = 145153231,
                tag_prefix = "v",
            },
        },
        ["aarch64-macos"] = {
            default_version = "6.3.21",
            upstream = {
                github = "devspace-sh/devspace",
                repository_id = 145153231,
                tag_prefix = "v",
            },
        },
        ["x86_64-linux"] = {
            default_version = "6.3.21",
            upstream = {
                github = "devspace-sh/devspace",
                repository_id = 145153231,
                tag_prefix = "v",
            },
        },
    },
    versions = {
        ["6.3.21"] = {
            digests = {
                ["aarch64-linux"] = "c6e4f9d6587d77b5498d56391667c5d88b65ced06ca7e03a4ac74f600c19c8c4",
                ["aarch64-macos"] = "c6e4f9d6587d77b5498d56391667c5d88b65ced06ca7e03a4ac74f600c19c8c4",
                ["x86_64-linux"] = "c6e4f9d6587d77b5498d56391667c5d88b65ced06ca7e03a4ac74f600c19c8c4",
            },
            revision = 3,
        },
    },
}
