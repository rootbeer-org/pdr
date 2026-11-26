return {
    name = "croc",
    description = "Send files between computers securely",
    homepage = "https://github.com/schollz/croc",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "schollz/croc",
        repository_id = 107286889,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/schollz/croc/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "croc-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                croc = ".",
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
        bins = { "croc" },
        checks = {
            { "croc", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "11.6.7",
        },
        ["aarch64-macos"] = {
            default_version = "11.6.7",
        },
        ["x86_64-linux"] = {
            default_version = "11.6.7",
        },
    },
    versions = {
        ["11.6.6"] = {
            digests = {
                ["aarch64-linux"] = "7b70ea161a1d6343b4499c81280d9650fadb1c298d3be96bbc54a2e8d8cd0c21",
                ["aarch64-macos"] = "7b70ea161a1d6343b4499c81280d9650fadb1c298d3be96bbc54a2e8d8cd0c21",
                ["x86_64-linux"] = "7b70ea161a1d6343b4499c81280d9650fadb1c298d3be96bbc54a2e8d8cd0c21",
            },
        },
        ["11.6.7"] = {
            digests = {
                ["aarch64-linux"] = "2481acb7c027c89201979cfddf848826ff485512c36eed364e174c3b032c8748",
                ["aarch64-macos"] = "2481acb7c027c89201979cfddf848826ff485512c36eed364e174c3b032c8748",
                ["x86_64-linux"] = "2481acb7c027c89201979cfddf848826ff485512c36eed364e174c3b032c8748",
            },
        },
    },
}
