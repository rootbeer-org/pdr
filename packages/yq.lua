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
            default_version = "4.54.1",
        },
        ["aarch64-macos"] = {
            default_version = "4.54.1",
        },
        ["x86_64-linux"] = {
            default_version = "4.54.1",
        },
    },
    versions = {
        ["4.53.6"] = {
            digests = {
                ["aarch64-linux"] = "132a28a669526f99dba52486ac80de3bdafdf9a1a52a0c6bd6045301aca0cd25",
                ["aarch64-macos"] = "132a28a669526f99dba52486ac80de3bdafdf9a1a52a0c6bd6045301aca0cd25",
                ["x86_64-linux"] = "132a28a669526f99dba52486ac80de3bdafdf9a1a52a0c6bd6045301aca0cd25",
            },
            revision = 3,
        },
        ["4.54.1"] = {
            digests = {
                ["aarch64-linux"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
                ["aarch64-macos"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
                ["x86_64-linux"] = "0cec36e7035dd56c508bda56245cbd71e4495d2317bc2528165c4162bce79335",
            },
        },
    },
}
