return {
    name = "bun",
    description = "JavaScript runtime, bundler, test runner, and package manager",
    homepage = "https://bun.sh",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "oven-sh/bun",
        repository_id = 357728969,
        tag = "bun-v{version}",
    },
    prebuilt = {
        github = "oven-sh/bun",
        tag = "bun-v{version}",
        asset = "bun-{target}.zip",
        install = {
            Archive = {
                format = "Zip",
                strip_prefix = "bun-{target}",
            },
        },
        dependencies = {
            { package = "7zip", kind = "build" },
        },
        steps = {
            install = {
                { "ln", "-s", "bun", "bunx" },
            },
        },
    },
    outputs = {
        bins = {
            bun = "bun",
            bunx = "bunx",
        },
        checks = {
            { "bun", "--version" },
            { "bun", "-e", "console.log(1+1)" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-aarch64",
            default_version = "1.4.4",
        },
        ["aarch64-macos"] = {
            target = "darwin-aarch64",
            default_version = "1.4.4",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "1.4.4",
        },
    },
    versions = {
        ["1.4.4"] = {
            digests = {
                ["aarch64-linux"] = "baa6bb36f51d6e58561e02bbea825038a9df454f673d6d776e8bbf86f8c7850e",
                ["aarch64-macos"] = "c240d7f0ccb90c263a849fcdb09b7ee62630d921348ed6aafda86b9d577bc510",
                ["x86_64-linux"] = "bf8ccbfb2b0b80159e0f9a6d15c55317add8077534dbc6130a3edb52fccb395c",
            },
        },
    },
}
