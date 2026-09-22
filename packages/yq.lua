return {
    name = "yq",
    description = "Query and transform structured data",
    homepage = "https://mikefarah.gitbook.io/yq/",
    default_license = "MIT",
    source = {
        url = "https://codeload.github.com/mikefarah/yq/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "yq-{version}",
    },
    build = { backend = "go", go = { binaries = { yq = "." } } },
    outputs = {
        bins = { "yq" },
        checks = { { "yq", "--version" }, { "yq", "--null-input", "--exit-status", "1 + 2 == 3" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.53.6",
            upstream = { github = "mikefarah/yq", repository_id = 43225113, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            default_version = "4.53.6",
            upstream = { github = "mikefarah/yq", repository_id = 43225113, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            default_version = "4.53.6",
            upstream = { github = "mikefarah/yq", repository_id = 43225113, tag_prefix = "v" },
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
    },
}
