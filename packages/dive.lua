return {
    schema = 2,
    name = "dive",
    description = "Explore container image layers",
    default_version = "0.13.1",
    homepage = "https://github.com/wagoodman/dive",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "wagoodman/dive",
        repository_id = 133251103,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/wagoodman/dive/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "dive-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { dive = "." },
            variables = { ["main.version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "dive" },
        checks = { { "dive", "--version" }, { "dive", "--help" } },
    },
    versions = {
        ["0.13.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "2a9666e9c3fddd5e2e5bad81dccda520b8102e7cea34e2888f264b4eb0506852",
                },
            },
        },
    },
}
