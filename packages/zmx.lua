return {
    name = "zmx",
    description = "Persist terminal sessions",
    homepage = "https://github.com/neurosnap/zmx",
    default_license = "MIT",
    upstream = {
        github = "neurosnap/zmx",
        repository_id = 1073900202,
        tag = "v{version}",
    },
    prebuilt = {
        github = "neurosnap/zmx",
        tag = "v{version}",
        asset = "zmx-{version}-{target}.tar.gz",
    },
    outputs = {
        bins = { "zmx" },
        checks = {
            { "zmx", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64",
            default_version = "0.8.1",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "0.8.1",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64",
            default_version = "0.8.1",
        },
    },
    versions = {
        ["0.8.1"] = {
            digests = {
                ["aarch64-linux"] = "943eb44c812333fd450da12097521afd3339436e86f8c2ac618b905c4c9ece68",
                ["aarch64-macos"] = "1d86b1c9fba47fa707a6f0e976b20510b07c1c26d0ed010b9414b2a2c5e6beef",
                ["x86_64-linux"] = "dfd75720b942466f28870731cc86dbc07afa72fb8f3bd5eeb4ff707e4eecebe8",
            },
            revision = 2,
        },
    },
}
