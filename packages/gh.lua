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
                version = "1.27.1",
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
            default_version = "2.102.1",
        },
        ["aarch64-macos"] = {
            default_version = "2.102.1",
        },
        ["x86_64-linux"] = {
            default_version = "2.102.1",
        },
    },
    versions = {
        ["2.102.0"] = {
            digests = {
                ["aarch64-linux"] = "08bf0ef8b4409893889175e0f5279d30d6edd96465816042c0d7c72eac598158",
                ["aarch64-macos"] = "08bf0ef8b4409893889175e0f5279d30d6edd96465816042c0d7c72eac598158",
                ["x86_64-linux"] = "08bf0ef8b4409893889175e0f5279d30d6edd96465816042c0d7c72eac598158",
            },
        },
        ["2.102.1"] = {
            digests = {
                ["aarch64-linux"] = "6a6959d4da3302d95812d8ba1a96ffb3e21874badb0dc25f2819184c372157fd",
                ["aarch64-macos"] = "6a6959d4da3302d95812d8ba1a96ffb3e21874badb0dc25f2819184c372157fd",
                ["x86_64-linux"] = "6a6959d4da3302d95812d8ba1a96ffb3e21874badb0dc25f2819184c372157fd",
            },
        },
    },
}
