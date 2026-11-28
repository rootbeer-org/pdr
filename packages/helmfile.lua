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
            default_version = "1.8.6",
        },
        ["aarch64-macos"] = {
            default_version = "1.8.6",
        },
        ["x86_64-linux"] = {
            default_version = "1.8.6",
        },
    },
    versions = {
        ["1.8.5"] = {
            digests = {
                ["aarch64-linux"] = "916370931c502d9b33f7aec56737b990d65e4b342c946506cdf8e8a9259c0303",
                ["aarch64-macos"] = "916370931c502d9b33f7aec56737b990d65e4b342c946506cdf8e8a9259c0303",
                ["x86_64-linux"] = "916370931c502d9b33f7aec56737b990d65e4b342c946506cdf8e8a9259c0303",
            },
        },
        ["1.8.6"] = {
            digests = {
                ["aarch64-linux"] = "b0aaa99fff72cae82517355a9bf49223ee58f962612825de87034ae04f708109",
                ["aarch64-macos"] = "b0aaa99fff72cae82517355a9bf49223ee58f962612825de87034ae04f708109",
                ["x86_64-linux"] = "b0aaa99fff72cae82517355a9bf49223ee58f962612825de87034ae04f708109",
            },
        },
    },
}
