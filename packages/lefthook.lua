return {
    schema = 2,
    name = "lefthook",
    description = "Run Git hooks",
    homepage = "https://github.com/evilmartians/lefthook",
    default_version = "2.1.14",
    upstream = {
        github = "evilmartians/lefthook",
        repository_id = 169250119,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/evilmartians/lefthook/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "lefthook-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { lefthook = "." },
            tags = { "no_self_update" },
        },
    },
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    outputs = {
        bins = { "lefthook" },
        checks = {
            { "lefthook", "version" },
            { "lefthook", "help" },
        },
    },
    versions = {
        ["2.1.12"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "c2e79ff53d31aaeb5a5765d118552a7b6f6e2667647347200386615ee4e88acf",
                },
            },
        },
        ["2.1.14"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "b1a99784f93339b24a24731646d4489d2f3496c4f79c9dac449aea3d92fc2be0",
                },
            },
        },
    },
}
