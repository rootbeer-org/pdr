return {
    name = "git-cliff",
    description = "Generate changelogs from Git history",
    homepage = "https://github.com/orhun/git-cliff",
    default_license = "Apache-2.0",
    upstream = {
        github = "orhun/git-cliff",
        repository_id = 372193147,
        tag = "v{version}",
    },
    prebuilt = {
        github = "orhun/git-cliff",
        tag = "v{version}",
        asset = "git-cliff-{version}-{target}.tar.gz",
    },
    outputs = {
        bins = { "git-cliff" },
        checks = {
            { "git-cliff", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "2.14.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "2.14.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "2.14.2",
        },
    },
    versions = {
        ["2.14.1"] = {
            digests = {
                ["aarch64-linux"] = "ee79fa39a8bb100b12937b0ac4800cc4436ae48f678ef8a1502ce99754552b0c",
                ["aarch64-macos"] = "2e2d1f60963aa6a201dbd21df14d7f44025328b8bb33437695f15a516598615a",
                ["x86_64-linux"] = "cba6ae86f0a4205784eed8ef049fe53c904138806e33a1bda2e25026b17198eb",
            },
            revision = 2,
        },
        ["2.14.2"] = {
            digests = {
                ["aarch64-linux"] = "4be21b21ec9699af4d330b224aeba8a41d41d8f5b351ca2da8a9ea2bdc36380f",
                ["aarch64-macos"] = "a0be97e237d440d34c5e508ec21d070b2c85cbb8be48a46a56f9a4e8bd247f05",
                ["x86_64-linux"] = "fa21e2fc70046fcfd0e43e5e4613873ab799aff3d9dc8559c00d31b270e417d0",
            },
        },
    },
}
