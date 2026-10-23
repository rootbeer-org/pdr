return {
    name = "xh",
    description = "Send HTTP requests from the terminal",
    homepage = "https://github.com/ducaale/xh",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "ducaale/xh",
        repository_id = 294521053,
        tag = "v{version}",
    },
    prebuilt = {
        github = "ducaale/xh",
        tag = "v{version}",
        asset = "xh-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "xh" },
        checks = {
            { "xh", "--version" },
            { "xh", "--offline", "--verify=no", "GET", "https://example.com" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-musl",
            default_version = "0.26.3",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.26.3",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.26.3",
        },
    },
    versions = {
        ["0.26.2"] = {
            digests = {
                ["aarch64-linux"] = "3a44900a8ac53f614aa0cd1d2e54ecf4e93584384c1ad091aa18d7992686d7eb",
                ["aarch64-macos"] = "cc5739d061a8469d0011ca0ab92d4a5cd726cc56f0ef30108953b119f54d0719",
                ["x86_64-linux"] = "8c53b6a23435754f9e2ea8ab8c0d0296a1921404b88132cf9b364ff6e8c22a6e",
            },
            revision = 2,
        },
        ["0.26.3"] = {
            digests = {
                ["aarch64-linux"] = "a45d8cb6c234c6850f9fc2395fc3544ab7691fb511237f00179aedba1bcd525e",
                ["aarch64-macos"] = "50d61bd755942752b054297a1612ec191654f137f8939673cda83c686cb5b0f2",
                ["x86_64-linux"] = "cbbf53bd76007d57d95e4bed8ba7fb3b7fcec22af4bdfc1ff119cd5de351e74f",
            },
        },
    },
}
