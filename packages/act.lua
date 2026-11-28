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
            default_version = "0.2.99",
        },
        ["aarch64-macos"] = {
            default_version = "0.2.99",
        },
        ["x86_64-linux"] = {
            default_version = "0.2.99",
        },
    },
    versions = {
        ["0.2.98"] = {
            digests = {
                ["aarch64-linux"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
                ["aarch64-macos"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
                ["x86_64-linux"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
            },
        },
        ["0.2.99"] = {
            digests = {
                ["aarch64-linux"] = "4dd92764a93c82e8a6a088424677b8eac4f77456e52d3de2b91bb9b21f43232c",
                ["aarch64-macos"] = "4dd92764a93c82e8a6a088424677b8eac4f77456e52d3de2b91bb9b21f43232c",
                ["x86_64-linux"] = "4dd92764a93c82e8a6a088424677b8eac4f77456e52d3de2b91bb9b21f43232c",
            },
        },
    },
}
