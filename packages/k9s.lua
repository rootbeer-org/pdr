return {
    schema = 2,
    name = "k9s",
    description = "Manage Kubernetes clusters in a terminal interface",
    default_version = "0.51.0",
    homepage = "https://github.com/derailed/k9s",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "derailed/k9s",
        repository_id = 167596393,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/derailed/k9s/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "k9s-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { k9s = "." },
            variables = { ["github.com/derailed/k9s/cmd.version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "k9s" },
        checks = { { "k9s", "version" } },
    },
    versions = {
        ["0.51.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "e2c3851c909b87f9cfafa262e426f4a89023ca4e745cba5cab6d0153f76e7dcd",
                },
            },
        },
    },
}
