return {
    name = "shellcheck",
    description = "Find bugs in shell scripts",
    homepage = "https://github.com/koalaman/shellcheck",
    default_license = "GPL-3.0",
    upstream = {
        github = "koalaman/shellcheck",
        repository_id = 6731432,
        tag = "v{version}",
    },
    prebuilt = {
        github = "koalaman/shellcheck",
        tag = "v{version}",
        asset = "shellcheck-{tag}.{target}.tar.gz",
    },
    outputs = {
        bins = { "shellcheck" },
        checks = {
            { "shellcheck", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux.aarch64",
            default_version = "0.11.0",
        },
        ["aarch64-macos"] = {
            target = "darwin.aarch64",
            default_version = "0.11.0",
        },
        ["x86_64-linux"] = {
            target = "linux.x86_64",
            default_version = "0.11.0",
        },
    },
    versions = {
        ["0.11.0"] = {
            digests = {
                ["aarch64-linux"] = "68a8133197a50beb8803f8d42f9908d1af1c5540d4bb05fdfca8c1fa47decefc",
                ["aarch64-macos"] = "339b930feb1ea764467013cc1f72d09cd6b869ebf1013296ba9055ab2ffbd26f",
                ["x86_64-linux"] = "b7af85e41cc99489dcc21d66c6d5f3685138f06d34651e6d34b42ec6d54fe6f6",
            },
            revision = 2,
        },
    },
}
