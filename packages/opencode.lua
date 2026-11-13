return {
    name = "opencode",
    description = "Run an AI coding agent in the terminal",
    homepage = "https://opencode.ai",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "anomalyco/opencode",
        repository_id = 975734319,
        tag = "v{version}",
    },
    prebuilt = {
        github = "anomalyco/opencode",
        tag = "v{version}",
        asset = "opencode-{target}",
    },
    outputs = {
        bins = { "opencode" },
        checks = {
            { "opencode", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64.tar.gz",
            default_version = "2.3.0",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64.zip",
            default_version = "2.3.0",
            prebuilt = {
                github = "anomalyco/opencode",
                tag = "v{version}",
                asset = "opencode-{target}",
                dependencies = {
                    { package = "7zip", kind = "build" },
                },
            },
        },
        ["x86_64-linux"] = {
            target = "linux-x64-baseline.tar.gz",
            default_version = "2.3.0",
        },
    },
    versions = {
        ["2.2.7"] = {
            digests = {
                ["aarch64-linux"] = "c1682057f0815cb2abdd6e00305f1146ebaf1c167f0335cdb74ddc80008120e7",
                ["aarch64-macos"] = "811c42be9cad489ea8c411ead49e06f691deee4957ba9a0a56a159a7d6c1abdc",
                ["x86_64-linux"] = "89a6cee227b54bc011179c528a5e63176032462b1a5e21723b616801cddc2ca7",
            },
        },
        ["2.3.0"] = {
            digests = {
                ["aarch64-linux"] = "3207fb5cdec448d479242c0f1a14f4f7bdfcad3a79209b5eb8f9003725e93711",
                ["aarch64-macos"] = "7907df2b12720a840fbb49c5b978b9b82925b6bf75479a5fd216afa8932b6702",
                ["x86_64-linux"] = "fc0f81522aceeabac47693d88389efa2bc517ce74c2c38fd6967819fcc6e4d3b",
            },
        },
    },
}
