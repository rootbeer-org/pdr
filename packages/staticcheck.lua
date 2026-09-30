return {
    name = "staticcheck",
    description = "Find bugs and performance issues in Go code",
    homepage = "https://staticcheck.dev",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "dominikh/go-tools",
        repository_id = 79954708,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/dominikh/go-tools/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "go-tools-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                staticcheck = "./cmd/staticcheck",
            },
        },
    },
    outputs = {
        bins = { "staticcheck" },
        checks = {
            { "staticcheck", "-version" },
            { "staticcheck", "-explain", "SA1000" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2026.2.1",
        },
        ["aarch64-macos"] = {
            default_version = "2026.2.1",
        },
        ["x86_64-linux"] = {
            default_version = "2026.2.1",
        },
    },
    versions = {
        ["2026.2.1"] = {
            digests = {
                ["aarch64-linux"] = "8d807cd909f4481d6777f7707e5ae75dcc399e14d68ff14a3c814731826e0dfc",
                ["aarch64-macos"] = "8d807cd909f4481d6777f7707e5ae75dcc399e14d68ff14a3c814731826e0dfc",
                ["x86_64-linux"] = "8d807cd909f4481d6777f7707e5ae75dcc399e14d68ff14a3c814731826e0dfc",
            },
        },
    },
}
