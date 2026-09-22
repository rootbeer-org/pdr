return {
    name = "k9s",
    description = "Manage Kubernetes clusters in a terminal interface",
    homepage = "https://github.com/derailed/k9s",
    default_license = "Apache-2.0",
    source = {
        url = "https://codeload.github.com/derailed/k9s/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "k9s-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { k9s = "." },
            variables = { ["github.com/derailed/k9s/cmd.version"] = "v{version}" },
        },
    },
    outputs = { bins = { "k9s" }, checks = { { "k9s", "version" } } },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.51.0",
            upstream = { github = "derailed/k9s", repository_id = 167596393, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "0.51.0",
            upstream = { github = "derailed/k9s", repository_id = 167596393, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "0.51.0",
            upstream = { github = "derailed/k9s", repository_id = 167596393, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.51.0"] = {
            digests = {
                ["aarch64-linux"] = "e2c3851c909b87f9cfafa262e426f4a89023ca4e745cba5cab6d0153f76e7dcd",
                ["aarch64-macos"] = "e2c3851c909b87f9cfafa262e426f4a89023ca4e745cba5cab6d0153f76e7dcd",
                ["x86_64-linux"] = "e2c3851c909b87f9cfafa262e426f4a89023ca4e745cba5cab6d0153f76e7dcd",
            },
            revision = 3,
        },
    },
}
