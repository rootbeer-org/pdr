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
            default_version = "1.50.3",
        },
        ["aarch64-macos"] = {
            default_version = "1.50.3",
        },
        ["x86_64-linux"] = {
            default_version = "1.50.3",
        },
    },
    versions = {
        ["1.50.3"] = {
            digests = {
                ["aarch64-linux"] = "64cad1fb73601e06b701456cc17a5b9b65536508e8299a27218175cae494c0f7",
                ["aarch64-macos"] = "64cad1fb73601e06b701456cc17a5b9b65536508e8299a27218175cae494c0f7",
                ["x86_64-linux"] = "64cad1fb73601e06b701456cc17a5b9b65536508e8299a27218175cae494c0f7",
            },
        },
    },
}
