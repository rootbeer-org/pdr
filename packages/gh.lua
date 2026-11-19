return {
    name = "gh",
    aliases = { "github-cli" },
    description = "Work with GitHub from the command line",
    homepage = "https://cli.github.com/",
    recipe_maintainers = { "tale" },
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
        dependencies = {
            {
                package = "go",
                kind = "build",
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
            default_version = "2.105.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.105.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.105.0",
        },
    },
    versions = {
        ["2.104.0"] = {
            digests = {
                ["aarch64-linux"] = "779060cbdc5a354fa2fc8afb56e9277f64a29ac599daefd941558356509081e4",
                ["aarch64-macos"] = "779060cbdc5a354fa2fc8afb56e9277f64a29ac599daefd941558356509081e4",
                ["x86_64-linux"] = "779060cbdc5a354fa2fc8afb56e9277f64a29ac599daefd941558356509081e4",
            },
        },
        ["2.105.0"] = {
            digests = {
                ["aarch64-linux"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
                ["aarch64-macos"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
                ["x86_64-linux"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
            },
        },
    },
}
