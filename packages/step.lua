return {
    name = "step",
    description = "Manage certificates and a private certificate authority",
    homepage = "https://smallstep.com/cli",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "smallstep/cli",
        repository_id = 141352703,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/smallstep/cli/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cli-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                step = "./cmd/step",
            },
            variables = {
                ["main.Version"] = "{version}",
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
        bins = { "step" },
        checks = {
            { "step", "version" },
            { "step", "crypto", "rand", "--format", "hex", "16" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.31.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.31.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.31.0",
        },
    },
    versions = {
        ["0.31.0"] = {
            digests = {
                ["aarch64-linux"] = "7eb9ba3d1d8edc07fe6e3bae0ee5a3b6fc7a60bbd850d334ccc74d02b5e4f0fe",
                ["aarch64-macos"] = "7eb9ba3d1d8edc07fe6e3bae0ee5a3b6fc7a60bbd850d334ccc74d02b5e4f0fe",
                ["x86_64-linux"] = "7eb9ba3d1d8edc07fe6e3bae0ee5a3b6fc7a60bbd850d334ccc74d02b5e4f0fe",
            },
            revision = 2,
        },
    },
}
