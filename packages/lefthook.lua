return {
    name = "lefthook",
    description = "Manage Git hooks",
    homepage = "https://lefthook.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "evilmartians/lefthook",
        repository_id = 169250119,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/evilmartians/lefthook/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "lefthook-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                lefthook = ".",
            },
            tags = { "no_self_update" },
        },
        dependencies = {
            {
                package = "go",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "lefthook" },
        checks = {
            { "lefthook", "version" },
            { "lefthook", "help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.2.3",
        },
        ["aarch64-macos"] = {
            default_version = "2.2.3",
        },
        ["x86_64-linux"] = {
            default_version = "2.2.3",
        },
    },
    versions = {
        ["2.2.2"] = {
            digests = {
                ["aarch64-linux"] = "c635447bcdb0b9f731e4ae54ac842c222ac6932bd545f87fe48fc20818b4c5f6",
                ["aarch64-macos"] = "c635447bcdb0b9f731e4ae54ac842c222ac6932bd545f87fe48fc20818b4c5f6",
                ["x86_64-linux"] = "c635447bcdb0b9f731e4ae54ac842c222ac6932bd545f87fe48fc20818b4c5f6",
            },
        },
        ["2.2.3"] = {
            digests = {
                ["aarch64-linux"] = "8fde63137b7249934dee9f35be38200bb02760021f82b6920dd9b2b58f843558",
                ["aarch64-macos"] = "8fde63137b7249934dee9f35be38200bb02760021f82b6920dd9b2b58f843558",
                ["x86_64-linux"] = "8fde63137b7249934dee9f35be38200bb02760021f82b6920dd9b2b58f843558",
            },
        },
    },
}
