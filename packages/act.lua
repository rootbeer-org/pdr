return {
    name = "act",
    description = "Run GitHub Actions workflows locally",
    homepage = "https://nektosact.com/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "nektos/act",
        repository_id = 163883279,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/nektos/act/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "act-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                act = ".",
            },
            variables = {
                ["main.version"] = "{version}",
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
        bins = { "act" },
        checks = {
            { "act", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.2.89",
        },
        ["aarch64-macos"] = {
            default_version = "0.2.89",
        },
        ["x86_64-linux"] = {
            default_version = "0.2.89",
        },
    },
    versions = {
        ["0.2.89"] = {
            digests = {
                ["aarch64-linux"] = "649cd5b91cad870871d2283fb3ad95c8fa1d5ced7a1db8d7b346d1a7dcd3ec71",
                ["aarch64-macos"] = "649cd5b91cad870871d2283fb3ad95c8fa1d5ced7a1db8d7b346d1a7dcd3ec71",
                ["x86_64-linux"] = "649cd5b91cad870871d2283fb3ad95c8fa1d5ced7a1db8d7b346d1a7dcd3ec71",
            },
            revision = 2,
        },
    },
}
