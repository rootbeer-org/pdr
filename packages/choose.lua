return {
    schema = 2,
    name = "choose",
    description = "Select fields and ranges from text",
    default_version = "1.3.7",
    homepage = "https://github.com/theryangeary/choose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "theryangeary/choose",
        repository_id = 207951619,
        tag_prefix = "v",
    },
    inputs = {
        prebuilt = {
            github = "theryangeary/choose",
            tag = "v{version}",
            assets = {
                ["x86_64-linux"] = "choose-x86_64-unknown-linux-musl",
                ["aarch64-macos"] = "choose-aarch64-apple-darwin",
                ["aarch64-linux"] = "choose-aarch64-unknown-linux-gnu",
            },
        },
    },
    outputs = {
        bins = { "choose" },
        checks = { { "choose", "--version" }, { "choose", "--help" } },
    },
    versions = {
        ["1.3.7"] = {},
    },
}
