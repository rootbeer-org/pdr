return {
    schema = 2,
    name = "helmfile",
    description = "Manage Helm releases from configuration files",
    default_version = "1.8.0",
    homepage = "https://github.com/helmfile/helmfile",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "helmfile/helmfile",
        repository_id = 474521466,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/helmfile/helmfile/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "helmfile-{version}",
        },
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
    versions = {
        ["1.8.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
                },
            },
        },
    },
}
