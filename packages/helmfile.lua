return {
    name = "helmfile",
    description = "Manage Helm releases from configuration files",
    homepage = "https://github.com/helmfile/helmfile",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/helmfile/helmfile/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "helmfile-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = { helmfile = "." },
            variables = { ["go.szostok.io/version.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "helmfile" },
        checks = { { "helmfile", "--version" }, { "helmfile", "build", "--help" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.8.0",
            upstream = { github = "helmfile/helmfile", repository_id = 474521466, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "1.8.0",
            upstream = { github = "helmfile/helmfile", repository_id = 474521466, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "1.8.0",
            upstream = { github = "helmfile/helmfile", repository_id = 474521466, tag_prefix = "v" },
        },
    },
    versions = {
        ["1.8.0"] = {
            digests = {
                ["aarch64-linux"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
                ["aarch64-macos"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
                ["x86_64-linux"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
            },
            revision = 3,
        },
    },
}
