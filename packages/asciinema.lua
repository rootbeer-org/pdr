return {
    name = "asciinema",
    description = "Record and replay terminal sessions",
    homepage = "https://github.com/asciinema/asciinema",
    default_license = "GPL-3.0",
    upstream = {
        github = "asciinema/asciinema",
        repository_id = 2823326,
        tag = "v{version}",
    },
    prebuilt = {
        github = "asciinema/asciinema",
        tag = "v{version}",
        asset = "asciinema-{target}",
    },
    outputs = {
        bins = { "asciinema" },
        checks = {
            { "asciinema", "--version" },
            { "asciinema", "rec", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "3.2.1",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "3.2.1",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "3.2.1",
        },
    },
    versions = {
        ["3.2.1"] = {
            digests = {
                ["aarch64-linux"] = "b516a6d896844c0ffbc96e0a55afe4cbcc79216abde0fc64fdda4e39bee421ea",
                ["aarch64-macos"] = "1f0c76da7855601df93e5dccdf69b7c683b81beff1411e38b3802de1f5fc7a1c",
                ["x86_64-linux"] = "bec9781bc8f297a9d3d74ff60205599507f2abba1183578b8b2f22be4c999214",
            },
            revision = 2,
        },
    },
}
