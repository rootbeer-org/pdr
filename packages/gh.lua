return {
    schema = 2,
    name = "gh",
    description = "Work with GitHub from the command line",
    homepage = "https://github.com/cli/cli",
    default_version = "2.101.0",
    upstream = {
        github = "cli/cli",
        repository_id = 212613049,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/cli/cli/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "cli-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { gh = "./cmd/gh" },
            variables = { ["github.com/cli/cli/v2/internal/build.Version"] = "{version}" },
        },
    },
    systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
    outputs = {
        bins = { "gh" },
        checks = {
            { "gh", "--version" },
        },
    },
    versions = {
        ["2.100.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "39d5123f08a553a6fa69e46de86c22d04d97a217e03d0e6584b66d0fea50f1fe",
                },
            },
            systems = { "aarch64-macos", "aarch64-linux", "x86_64-linux" },
        },
        ["2.101.0"] = {
            revision = 2,
            inputs = {
                source = {
                    sha256 = "a266fe8575c0e061b987920c1831a15f71bf0036a8729a5ebb93c2fb0164899c",
                },
            },
        },
    },
}
