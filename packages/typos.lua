return {
    name = "typos",
    description = "Find and fix spelling mistakes in source code",
    homepage = "https://github.com/crate-ci/typos",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "crate-ci/typos",
        repository_id = 181782286,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/crate-ci/typos/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "typos-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "typos-cli" },
        },
    },
    outputs = {
        bins = { "typos" },
        checks = {
            { "typos", "--version" },
            { "typos", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.52.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.52.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.52.2",
        },
    },
    versions = {
        ["1.52.1"] = {
            digests = {
                ["aarch64-linux"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
                ["aarch64-macos"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
                ["x86_64-linux"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
            },
        },
        ["1.52.2"] = {
            digests = {
                ["aarch64-linux"] = "72d8b9ab9cc54512865f51d8ff65903532785b1c32d58fc4e179ddf89299c5be",
                ["aarch64-macos"] = "72d8b9ab9cc54512865f51d8ff65903532785b1c32d58fc4e179ddf89299c5be",
                ["x86_64-linux"] = "72d8b9ab9cc54512865f51d8ff65903532785b1c32d58fc4e179ddf89299c5be",
            },
        },
    },
}
