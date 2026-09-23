return {
    name = "delta",
    description = "Display readable diffs",
    homepage = "https://github.com/dandavison/delta",
    default_license = "MIT",
    upstream = {
        github = "dandavison/delta",
        repository_id = 193526915,
        tag = "{version}",
    },
    prebuilt = {
        github = "dandavison/delta",
        tag = "{version}",
        asset = "delta-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "delta" },
        checks = {
            { "delta", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.19.2",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.19.2",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.19.2",
        },
    },
    versions = {
        ["0.18.2"] = {
            digests = {
                ["aarch64-linux"] = "adf7674086daa4582f598f74ce9caa6b70c1ba8f4a57d2911499b37826b014f9",
                ["aarch64-macos"] = "6ba38dce9f91ee1b9a24aa4aede1db7195258fe176c3f8276ae2d4457d8170a0",
                ["x86_64-linux"] = "b7ea845004762358a00ef9127dd9fd723e333c7e4b9cb1da220c3909372310ee",
            },
            revision = 2,
        },
        ["0.19.2"] = {
            digests = {
                ["aarch64-linux"] = "0bfce159a5cddd5feb3d6db4a616d883ff51253ce08ac7ec11cb1d208cfaab9e",
                ["aarch64-macos"] = "9be36612a5a13e9e386dc498fb8e50dc87c72ee42b63db0ea05b32f99a72a69a",
                ["x86_64-linux"] = "f1ea01ca7728ce3462debc359f39dfc7cbbc1a63224b71fefabf92042864aa1b",
            },
        },
    },
}
