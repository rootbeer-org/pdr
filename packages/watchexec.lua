return {
    name = "watchexec",
    description = "Run commands when files change",
    homepage = "https://github.com/watchexec/watchexec",
    default_license = "Apache-2.0",
    upstream = {
        github = "watchexec/watchexec",
        repository_id = 68546136,
        tag = "v{version}",
    },
    prebuilt = {
        github = "watchexec/watchexec",
        tag = "v{version}",
        asset = "watchexec-{version}-{target}.tar.xz",
    },
    outputs = {
        bins = { "watchexec" },
        checks = {
            { "watchexec", "--version" },
            { "watchexec", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "2.7.3",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "2.7.3",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "2.7.3",
        },
    },
    versions = {
        ["2.7.2"] = {
            digests = {
                ["aarch64-linux"] = "83cbce2ffc85adaab14d6ded09b292f4383358ac6d9a51b4e4e083df0cb7c831",
                ["aarch64-macos"] = "31e553b7160720796266168987c5e0728c388cc4776a26297b6a9feb00ab6437",
                ["x86_64-linux"] = "a2c01f82fb4cdafca1fa12cb88e4a1145dec63364dbdf92664efbaac3bb44dd2",
            },
            revision = 2,
        },
        ["2.7.3"] = {
            digests = {
                ["aarch64-linux"] = "80bd9acfc25e4035624d99585b2f920add5ecbdc0c732c4e42fa1451b63d80a5",
                ["aarch64-macos"] = "bb2a3acc02de5c64f87779fc0226274d47d79026c6df969c8c1034a110b2efad",
                ["x86_64-linux"] = "b5bcd00ae3ebb53f7ea5d499fdf98bda14711589a7ecc0619e1847586beaa24d",
            },
        },
    },
}
