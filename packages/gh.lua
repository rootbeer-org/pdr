return {
    name = "gh",
    description = "Work with GitHub from the command line",
    homepage = "https://github.com/cli/cli",
    default_license = "MIT",
    upstream = {
        github = "cli/cli",
        repository_id = 212613049,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/cli/cli/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "cli-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gh = "./cmd/gh",
            },
            variables = {
                ["github.com/cli/cli/v2/internal/build.Version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "gh" },
        checks = {
            { "gh", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.101.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.101.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.101.0",
        },
    },
    versions = {
        ["2.100.0"] = {
            digests = {
                ["aarch64-linux"] = "39d5123f08a553a6fa69e46de86c22d04d97a217e03d0e6584b66d0fea50f1fe",
                ["aarch64-macos"] = "39d5123f08a553a6fa69e46de86c22d04d97a217e03d0e6584b66d0fea50f1fe",
                ["x86_64-linux"] = "39d5123f08a553a6fa69e46de86c22d04d97a217e03d0e6584b66d0fea50f1fe",
            },
            revision = 3,
        },
        ["2.101.0"] = {
            digests = {
                ["aarch64-linux"] = "a266fe8575c0e061b987920c1831a15f71bf0036a8729a5ebb93c2fb0164899c",
                ["aarch64-macos"] = "a266fe8575c0e061b987920c1831a15f71bf0036a8729a5ebb93c2fb0164899c",
                ["x86_64-linux"] = "a266fe8575c0e061b987920c1831a15f71bf0036a8729a5ebb93c2fb0164899c",
            },
            revision = 2,
        },
    },
}
