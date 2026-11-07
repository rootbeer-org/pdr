return {
    name = "jj",
    aliases = { "jujutsu" },
    description = "Manage version control with a Git-compatible VCS",
    homepage = "https://jj-vcs.github.io/jj/",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "jj-vcs/jj",
        repository_id = 322484700,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/jj-vcs/jj/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "jj-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "jj-cli" },
        },
    },
    outputs = {
        bins = { "jj" },
        checks = {
            { "jj", "--version" },
            { "jj", "help", "--keyword", "revsets" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.47.1",
        },
        ["aarch64-macos"] = {
            default_version = "0.47.1",
        },
        ["x86_64-linux"] = {
            default_version = "0.47.1",
        },
    },
    versions = {
        ["0.46.0"] = {
            digests = {
                ["aarch64-linux"] = "6489f79d59dc4f9c11230c51d309dc9c6ec392921772b738546966c494b6d72c",
                ["aarch64-macos"] = "6489f79d59dc4f9c11230c51d309dc9c6ec392921772b738546966c494b6d72c",
                ["x86_64-linux"] = "6489f79d59dc4f9c11230c51d309dc9c6ec392921772b738546966c494b6d72c",
            },
        },
        ["0.47.1"] = {
            digests = {
                ["aarch64-linux"] = "838fb5ddbf474ccee6639ce68835cedf88c8285b5c812599c56688286fb0b7a6",
                ["aarch64-macos"] = "838fb5ddbf474ccee6639ce68835cedf88c8285b5c812599c56688286fb0b7a6",
                ["x86_64-linux"] = "838fb5ddbf474ccee6639ce68835cedf88c8285b5c812599c56688286fb0b7a6",
            },
        },
    },
}
