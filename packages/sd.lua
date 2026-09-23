return {
    name = "sd",
    description = "Find and replace text",
    homepage = "https://github.com/chmln/sd",
    default_license = "MIT",
    upstream = {
        github = "chmln/sd",
        repository_id = 162863623,
        tag = "v{version}",
    },
    prebuilt = {
        github = "chmln/sd",
        tag = "v{version}",
        asset = "sd-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "sd" },
        checks = {
            { "sd", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "1.1.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "1.1.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "1.1.0",
        },
    },
    versions = {
        ["1.1.0"] = {
            digests = {
                ["aarch64-linux"] = "ec8c93c0533ff21f4851d11566808d4082544baf063d9b96ea77c27e98b7cd99",
                ["aarch64-macos"] = "4bd3c09226376ca0a1d69589c91e86276fae36c5fbaaee669afce583f6682030",
                ["x86_64-linux"] = "02f00f4777d43e8e95b7b8d49e1a0d6e502fed4b8e79c1c8b8063857a30caa2e",
            },
            revision = 2,
        },
    },
}
