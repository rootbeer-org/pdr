return {
    schema = 2,
    name = "yq",
    description = "Query and transform structured data",
    default_version = "4.53.6",
    homepage = "https://mikefarah.gitbook.io/yq/",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mikefarah/yq",
        repository_id = 43225113,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/mikefarah/yq/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "yq-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { yq = "." },
        },
    },
    outputs = {
        bins = { "yq" },
        checks = { { "yq", "--version" }, { "yq", "--null-input", "--exit-status", "1 + 2 == 3" } },
    },
    versions = {
        ["4.53.6"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "132a28a669526f99dba52486ac80de3bdafdf9a1a52a0c6bd6045301aca0cd25",
                },
            },
        },
    },
}
