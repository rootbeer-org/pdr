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
            default_version = "1.8.3",
        },
        ["aarch64-macos"] = {
            default_version = "1.8.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.8.3",
        },
    },
    versions = {
        ["1.8.2"] = {
            digests = {
                ["aarch64-linux"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
                ["aarch64-macos"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
                ["x86_64-linux"] = "641e9eec8ccd402bae60254ae29dfb144f02e16e089f5777b5465b04d12b241c",
            },
        },
        ["1.8.3"] = {
            digests = {
                ["aarch64-linux"] = "fd3f37bc48ff8bb343e6b9869b0b070052e8d8fa3eafce0305de0b223c7bf63c",
                ["aarch64-macos"] = "fd3f37bc48ff8bb343e6b9869b0b070052e8d8fa3eafce0305de0b223c7bf63c",
                ["x86_64-linux"] = "fd3f37bc48ff8bb343e6b9869b0b070052e8d8fa3eafce0305de0b223c7bf63c",
            },
        },
    },
}
