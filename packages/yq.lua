return {
    name = "yq",
    description = "Query and transform YAML, JSON, and XML",
    homepage = "https://mikefarah.gitbook.io/yq/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "mikefarah/yq",
        repository_id = 43225113,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/mikefarah/yq/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "yq-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                yq = ".",
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
        bins = { "yq" },
        checks = {
            { "yq", "--version" },
            { "yq", "--null-input", "--exit-status", "1 + 2 == 3" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.54.2",
        },
        ["aarch64-macos"] = {
            default_version = "4.54.2",
        },
        ["x86_64-linux"] = {
            default_version = "4.54.2",
        },
    },
    versions = {
        ["4.54.1"] = {
            digests = {
                ["aarch64-linux"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
                ["aarch64-macos"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
                ["x86_64-linux"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
            },
        },
        ["4.54.2"] = {
            digests = {
                ["aarch64-linux"] = "13391403bb284452e102a532037c1ce5f5cd9d2a45f3e70521e810d5c32afe46",
                ["aarch64-macos"] = "13391403bb284452e102a532037c1ce5f5cd9d2a45f3e70521e810d5c32afe46",
                ["x86_64-linux"] = "13391403bb284452e102a532037c1ce5f5cd9d2a45f3e70521e810d5c32afe46",
            },
        },
    },
}
