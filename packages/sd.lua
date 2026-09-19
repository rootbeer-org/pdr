return {
    schema = 2,
    name = "sd",
    description = "Find and replace text",
    default_version = "1.1.0",
    homepage = "https://github.com/chmln/sd",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "chmln/sd",
        repository_id = 162863623,
        tag_prefix = "v",
    },
    build = {
        backend = "rust",
        rust = { packages = { "sd-cli" } },
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/chmln/sd/tar.gz/refs/tags/v{version}",
            archive = "tar.gz",
            strip_prefix = "sd-{version}",
        },
    },
    outputs = {
        bins = { "sd" },
        checks = { { "sd", "--version" } },
    },
    versions = {
        ["1.1.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "defdce484f8c92f265e1282490572575028967c2c55d356111d1e49a3ea9a88e",
                },
            },
        },
    },
}
