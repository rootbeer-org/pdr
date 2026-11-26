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
            default_version = "2.106.0",
        },
        ["aarch64-macos"] = {
            default_version = "2.106.0",
        },
        ["x86_64-linux"] = {
            default_version = "2.106.0",
        },
    },
    versions = {
        ["2.105.0"] = {
            digests = {
                ["aarch64-linux"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
                ["aarch64-macos"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
                ["x86_64-linux"] = "3a8fddd2ca0f7c96983a251d3971a84ef042b230b26ca696e5e6ed811cd0ed8d",
            },
        },
        ["2.106.0"] = {
            digests = {
                ["aarch64-linux"] = "ffbaa7f4ba49ca7755ad29c4c92ae28046a969c47476a2218e3ae30183f81346",
                ["aarch64-macos"] = "ffbaa7f4ba49ca7755ad29c4c92ae28046a969c47476a2218e3ae30183f81346",
                ["x86_64-linux"] = "ffbaa7f4ba49ca7755ad29c4c92ae28046a969c47476a2218e3ae30183f81346",
            },
        },
    },
}
