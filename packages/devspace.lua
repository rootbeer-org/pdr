return {
    schema = 2,
    name = "devspace",
    description = "Develop applications in Kubernetes",
    default_version = "6.3.21",
    homepage = "https://github.com/devspace-sh/devspace",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "devspace-sh/devspace",
        repository_id = 145153231,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/devspace-sh/devspace/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "devspace-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { devspace = "." },
            variables = { ["main.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "devspace" },
        checks = { { "devspace", "version" } },
    },
    versions = {
        ["6.3.21"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "c6e4f9d6587d77b5498d56391667c5d88b65ced06ca7e03a4ac74f600c19c8c4",
                },
            },
        },
    },
}
