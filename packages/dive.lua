return {
    name = "dive",
    description = "Explore container image layers",
    homepage = "https://github.com/wagoodman/dive",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "wagoodman/dive",
        repository_id = 133251103,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/wagoodman/dive/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "dive-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                dive = ".",
            },
            variables = {
                ["main.version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "dive" },
        checks = {
            { "dive", "--version" },
            { "dive", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.13.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.13.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.13.1",
        },
    },
    versions = {
        ["0.13.1"] = {
            digests = {
                ["aarch64-linux"] = "2a9666e9c3fddd5e2e5bad81dccda520b8102e7cea34e2888f264b4eb0506852",
                ["aarch64-macos"] = "2a9666e9c3fddd5e2e5bad81dccda520b8102e7cea34e2888f264b4eb0506852",
                ["x86_64-linux"] = "2a9666e9c3fddd5e2e5bad81dccda520b8102e7cea34e2888f264b4eb0506852",
            },
            revision = 3,
        },
    },
}
