return {
    name = "zmx",
    description = "Persist terminal sessions",
    homepage = "https://zmx.sh",
    recipe_maintainers = { "tale" },
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
            default_version = "1.0.1",
        },
        ["aarch64-macos"] = {
            target = "macos-aarch64",
            default_version = "1.0.1",
        },
        ["x86_64-linux"] = {
            target = "linux-x86_64",
            default_version = "1.0.1",
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
        ["1.0.1"] = {
            digests = {
                ["aarch64-linux"] = "868de83abc66dc59a5c864ecdef4d5cb763985eedf8b9c1099af9ce75e51fc6b",
                ["aarch64-macos"] = "eb062a16f6d2570958622523e9f8965d9dbb238fd417ad7be33d69025ddb661a",
                ["x86_64-linux"] = "47319ff9f330b65e14dc799517699d13c5f322820d08abecab99f8b18beaaa2d",
            },
        },
    },
}
