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
            default_version = "1.52.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.52.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.52.1",
        },
    },
    versions = {
        ["1.52.0"] = {
            digests = {
                ["aarch64-linux"] = "5c4e27cb8ef43e7ebf8151a671f2db4888b53872641bdd6a66ec20de7397de14",
                ["aarch64-macos"] = "5c4e27cb8ef43e7ebf8151a671f2db4888b53872641bdd6a66ec20de7397de14",
                ["x86_64-linux"] = "5c4e27cb8ef43e7ebf8151a671f2db4888b53872641bdd6a66ec20de7397de14",
            },
        },
        ["1.52.1"] = {
            digests = {
                ["aarch64-linux"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
                ["aarch64-macos"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
                ["x86_64-linux"] = "209843886c11726f9645a77f2aa97e99c3d8c7ea4a9277f70222e9197111c2af",
            },
        },
    },
}
