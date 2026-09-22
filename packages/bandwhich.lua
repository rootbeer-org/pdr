return {
    name = "bandwhich",
    description = "Monitor network usage by process",
    homepage = "https://github.com/imsnif/bandwhich",
    default_license = "MIT",
    prebuilt = {
        github = "imsnif/bandwhich",
        tag = "v{version}",
        asset = "bandwhich-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "bandwhich" },
        checks = { { "bandwhich", "--version" }, { "bandwhich", "--help" } },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.23.1",
            upstream = { github = "imsnif/bandwhich", repository_id = 206874323, tag_prefix = "v" },
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.23.1",
            upstream = { github = "imsnif/bandwhich", repository_id = 206874323, tag_prefix = "v" },
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.23.1",
            upstream = { github = "imsnif/bandwhich", repository_id = 206874323, tag_prefix = "v" },
        },
    },
    versions = {
        ["0.23.1"] = {
            digests = {
                ["aarch64-linux"] = "6bbf084e5280a1a10833b8f466728ff428a7d637282c0487d6fcda0c4781357a",
                ["aarch64-macos"] = "3b440e6a48c94c2ca7507d45f769d8e97fe9069bafa6f718b045a185addfad36",
                ["x86_64-linux"] = "fec93e01c393cd3ef8aa168a675dffb8fa4841d5fd93390b5d14f238ae29e59c",
            },
            revision = 2,
        },
    },
}
