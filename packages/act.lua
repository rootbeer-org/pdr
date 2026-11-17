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
            default_version = "0.2.98",
        },
        ["aarch64-macos"] = {
            default_version = "0.2.98",
        },
        ["x86_64-linux"] = {
            default_version = "0.2.98",
        },
    },
    versions = {
        ["0.2.97"] = {
            digests = {
                ["aarch64-linux"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
                ["aarch64-macos"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
                ["x86_64-linux"] = "807e43becd597f65c76c7d5dd6dbe5ff94285629214f6005ad18ce618b70e49c",
            },
        },
        ["0.2.98"] = {
            digests = {
                ["aarch64-linux"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
                ["aarch64-macos"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
                ["x86_64-linux"] = "4e572417b47a2bed56663d5a06ce60f6aa90e1cb4f6e103b9cae0dee852a0ca5",
            },
        },
    },
}
