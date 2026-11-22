return {
    name = "pnpm",
    description = "Node.js package manager with a shared content-addressed store",
    homepage = "https://pnpm.io",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "pnpm/pnpm",
        repository_id = 50565430,
        tag = "v{version}",
    },
    prebuilt = {
        github = "pnpm/pnpm",
        tag = "v{version}",
        asset = "pnpm-{target}.tar.gz",
    },
    outputs = {
        bins = { "pnpm" },
        checks = {
            { "pnpm", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "12.23.0",
        },
        ["aarch64-macos"] = {
            target = "darwin-arm64",
            default_version = "12.23.0",
        },
        ["x86_64-linux"] = {
            target = "linux-x64",
            default_version = "12.23.0",
        },
    },
    versions = {
        ["12.22.0"] = {
            digests = {
                ["aarch64-linux"] = "22b23da8b00d12c2fdfc41b5533b65b467c7b178d93fdfe9128c491585dff1a4",
                ["aarch64-macos"] = "af43c44f22ef89191d83163c3ef9f5ee021a7368f401c95d92731be7d6b21cc5",
                ["x86_64-linux"] = "07ee196f91af1e21edb0c794401f4152932c74b0dba5d415dc4dbd5783f3c7af",
            },
        },
        ["12.23.0"] = {
            digests = {
                ["aarch64-linux"] = "dd03f7616625ff8f13d952f641f0864a2300d73d0a751a682737615bd9f9a7a2",
                ["aarch64-macos"] = "52bb314bf0d48928fc15126ccce42aa199275e29018bef112a04ae8acdcaaf14",
                ["x86_64-linux"] = "b515e29f2ac1adc0fbe63173414a6682827baff24f17e7ad3476821bdef236ac",
            },
        },
    },
}
