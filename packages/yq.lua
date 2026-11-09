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
            default_version = "4.54.3",
        },
        ["aarch64-macos"] = {
            default_version = "4.54.3",
        },
        ["x86_64-linux"] = {
            default_version = "4.54.3",
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
        ["4.54.3"] = {
            digests = {
                ["aarch64-linux"] = "93143d49b2a3bd6cb723477f585366b29f70c636af4653191d61b49b0c47de7f",
                ["aarch64-macos"] = "93143d49b2a3bd6cb723477f585366b29f70c636af4653191d61b49b0c47de7f",
                ["x86_64-linux"] = "93143d49b2a3bd6cb723477f585366b29f70c636af4653191d61b49b0c47de7f",
            },
        },
    },
}
