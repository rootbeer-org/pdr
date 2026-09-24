return {
    name = "pastel",
    description = "Generate and transform colors",
    homepage = "https://github.com/sharkdp/pastel",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "sharkdp/pastel",
        repository_id = 189867161,
        tag = "v{version}",
    },
    prebuilt = {
        github = "sharkdp/pastel",
        tag = "v{version}",
        asset = "pastel-{tag}-{target}.tar.gz",
    },
    outputs = {
        bins = { "pastel" },
        checks = {
            { "pastel", "--version" },
            { "pastel", "format", "hex", "red" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "aarch64-unknown-linux-gnu",
            default_version = "0.12.0",
        },
        ["aarch64-macos"] = {
            target = "aarch64-apple-darwin",
            default_version = "0.12.0",
        },
        ["x86_64-linux"] = {
            target = "x86_64-unknown-linux-musl",
            default_version = "0.12.0",
        },
    },
    versions = {
        ["0.12.0"] = {
            digests = {
                ["aarch64-linux"] = "f437e19974399ab7ae99fa52b76a2cdfad4fafafde3b48243100d371894935ba",
                ["aarch64-macos"] = "7fd81518fac1dab7bd60e4759194a942c51bb911ef5de4513f4a9e3fb4b8ac1c",
                ["x86_64-linux"] = "96ddd6593d08fd3868f2423f18ed5c6117a5f1aab335c1fc9e8347db7f219f2a",
            },
            revision = 2,
        },
    },
}
