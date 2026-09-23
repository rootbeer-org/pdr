return {
    name = "prtui",
    description = "Review GitHub pull requests in the terminal",
    homepage = "https://github.com/tale/prtui",
    default_license = "MIT",
    upstream = {
        github = "tale/prtui",
        repository_id = 1333872697,
        tag = "v{version}",
    },
    prebuilt = {
        github = "tale/prtui",
        tag = "v{version}",
        asset = "prtui-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "prtui" },
        checks = {
            { "prtui", "--version" },
            { "prtui", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.4.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.4.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-gnu",
            default_version = "0.4.0",
        },
    },
    versions = {
        ["0.3.0"] = {
            digests = {
                ["aarch64-linux"] = "b142d10f233c3458009aa7d073149cbe9b02af0baec50bd5318dc9e0bdc6f267",
                ["aarch64-macos"] = "37e6527a47464e52c45d4df54aa741df42eaf45a7c560c93542cb78aaa416981",
                ["x86_64-linux"] = "3426467d9a482b0696f9d9e0d700a29250edc6a49015762f0d41a458a419c7d5",
            },
            revision = 3,
        },
        ["0.4.0"] = {
            digests = {
                ["aarch64-linux"] = "1f64fa8301d6fe6310b98eaec9b045e2f9b193c3f0ab2bdaf68ddb2372337cb2",
                ["aarch64-macos"] = "2b4b92163eb420073b79096bf2ba81da16de5ebfa78404ca854ea47946a93024",
                ["x86_64-linux"] = "2d8607558390b9d67676e8e8991a834463cb82fae773a63abd28f3380e389f32",
            },
        },
    },
}
