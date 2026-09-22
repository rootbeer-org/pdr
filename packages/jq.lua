return {
    name = "jq",
    description = "Query and transform JSON",
    homepage = "https://github.com/jqlang/jq",
    default_license = "NOASSERTION",
    prebuilt = { github = "jqlang/jq", tag = "jq-{version}", asset = "jq-{target}" },
    outputs = {
        bins = { "jq" },
        checks = {
            { "jq", "--version" },
            { "jq", "--null-input", "--exit-status", "[1,2,3] | add == 6" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "1.8.2",
            upstream = { github = "jqlang/jq", repository_id = 5101141, tag_prefix = "jq-" },
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "1.8.2",
            upstream = { github = "jqlang/jq", repository_id = 5101141, tag_prefix = "jq-" },
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.8.2",
            upstream = { github = "jqlang/jq", repository_id = 5101141, tag_prefix = "jq-" },
        },
    },
    versions = {
        ["1.8.2"] = {
            digests = {
                ["aarch64-linux"] = "8b85c817833814ddca00a144c33705546355afccf0cf39b188f3cdb48b852309",
                ["aarch64-macos"] = "2d75340ba57a4b4b4c8708a21c2dc8e958a48aaa8bba13b27f77f6e4c0eca07e",
                ["x86_64-linux"] = "b1c22172dd303f3be49e935aa56aa48a8b7a46e0bc838b4997d3bb451495870f",
            },
            revision = 3,
        },
    },
}
