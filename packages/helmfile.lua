return {
    name = "helmfile",
    description = "Manage Helm releases from configuration files",
    homepage = "https://helmfile.readthedocs.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "helmfile/helmfile",
        repository_id = 474521466,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/helmfile/helmfile/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "helmfile-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                helmfile = ".",
            },
            variables = {
                ["go.szostok.io/version.version"] = "{version}",
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
        bins = { "helmfile" },
        checks = {
            { "helmfile", "--version" },
            { "helmfile", "build", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.8.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.8.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.8.1",
        },
    },
    versions = {
        ["1.8.0"] = {
            digests = {
                ["aarch64-linux"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
                ["aarch64-macos"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
                ["x86_64-linux"] = "acc51a53c5da30a33745c3cd0de813f2a2c9f3866ac986caac7c8b8ad01600e0",
            },
            revision = 4,
        },
        ["1.8.1"] = {
            digests = {
                ["aarch64-linux"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
                ["aarch64-macos"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
                ["x86_64-linux"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
            },
        },
    },
}
