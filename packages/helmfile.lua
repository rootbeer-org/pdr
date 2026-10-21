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
            default_version = "1.8.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.8.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.8.2",
        },
    },
    versions = {
        ["1.8.1"] = {
            digests = {
                ["aarch64-linux"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
                ["aarch64-macos"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
                ["x86_64-linux"] = "4db4e52d34899770769836352b1046d3e2c4d1c566ac4372879081199aeb2dc6",
            },
        },
        ["1.8.2"] = {
            digests = {
                ["aarch64-linux"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
                ["aarch64-macos"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
                ["x86_64-linux"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
            },
        },
    },
}
