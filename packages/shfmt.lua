return {
    name = "shfmt",
    description = "Format shell scripts",
    homepage = "https://github.com/mvdan/sh",
    recipe_maintainers = { "tale" },
    default_license = "BSD-3-Clause",
    upstream = {
        github = "mvdan/sh",
        repository_id = 49766020,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/mvdan/sh/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "sh-{version}",
        patches = {
            "version-variable.patch",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                shfmt = "./cmd/shfmt",
            },
            variables = {
                ["main.version"] = "v{version}",
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
        bins = { "shfmt" },
        checks = {
            { "shfmt", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.14.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.14.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.14.1",
        },
    },
    versions = {
        ["3.14.1"] = {
            digests = {
                ["aarch64-linux"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                ["aarch64-macos"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                ["x86_64-linux"] = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
            },
            revision = 5,
        },
    },
}
