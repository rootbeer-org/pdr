return {
    name = "gdu",
    description = "Analyze disk usage interactively",
    homepage = "https://github.com/dundee/gdu",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dundee/gdu",
        repository_id = 122750502,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/dundee/gdu/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "gdu-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gdu = "./cmd/gdu",
            },
            variables = {
                ["github.com/dundee/gdu/v5/build.Version"] = "v{version}",
            },
        },
        dependencies = {
            {
                package = "go",
                version = "1.27.1",
                kind = "build",
            },
        },
    },
    outputs = {
        bins = { "gdu" },
        checks = {
            { "gdu", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "5.37.0",
        },
        ["aarch64-macos"] = {
            default_version = "5.37.0",
        },
        ["x86_64-linux"] = {
            default_version = "5.37.0",
        },
    },
    versions = {
        ["5.37.0"] = {
            digests = {
                ["aarch64-linux"] = "48e20d39a1bf706b3e11bbfeae550a0890610d3e6030a73952903f5fcf062347",
                ["aarch64-macos"] = "48e20d39a1bf706b3e11bbfeae550a0890610d3e6030a73952903f5fcf062347",
                ["x86_64-linux"] = "48e20d39a1bf706b3e11bbfeae550a0890610d3e6030a73952903f5fcf062347",
            },
            revision = 2,
        },
    },
}
