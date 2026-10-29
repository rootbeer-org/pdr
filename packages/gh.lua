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
            default_version = "2.103.3",
        },
        ["aarch64-macos"] = {
            default_version = "2.103.3",
        },
        ["x86_64-linux"] = {
            default_version = "2.103.3",
        },
    },
    versions = {
        ["2.103.2"] = {
            digests = {
                ["aarch64-linux"] = "73a62f89937b2c058e0873a571f4963a28c7c78d3b60d0bf29e5658789eb8012",
                ["aarch64-macos"] = "73a62f89937b2c058e0873a571f4963a28c7c78d3b60d0bf29e5658789eb8012",
                ["x86_64-linux"] = "73a62f89937b2c058e0873a571f4963a28c7c78d3b60d0bf29e5658789eb8012",
            },
        },
        ["2.103.3"] = {
            digests = {
                ["aarch64-linux"] = "bb148138a3a2fe023e57c78042fe3b42fc09171c0e8fff4cf983b227b7a2eade",
                ["aarch64-macos"] = "bb148138a3a2fe023e57c78042fe3b42fc09171c0e8fff4cf983b227b7a2eade",
                ["x86_64-linux"] = "bb148138a3a2fe023e57c78042fe3b42fc09171c0e8fff4cf983b227b7a2eade",
            },
        },
    },
}
