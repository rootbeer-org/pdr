return {
    name = "stern",
    description = "Follow logs from multiple Kubernetes pods",
    homepage = "https://github.com/stern/stern",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "stern/stern",
        repository_id = 306013800,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/stern/stern/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "stern-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                stern = ".",
            },
            variables = {
                ["github.com/stern/stern/cmd.version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "stern" },
        checks = {
            { "stern", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.34.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.34.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.34.0",
        },
    },
    versions = {
        ["1.34.0"] = {
            digests = {
                ["aarch64-linux"] = "1cfec22cef9705e68fc46060ba85164af12bd07ede9264bafb67d11400996e71",
                ["aarch64-macos"] = "1cfec22cef9705e68fc46060ba85164af12bd07ede9264bafb67d11400996e71",
                ["x86_64-linux"] = "1cfec22cef9705e68fc46060ba85164af12bd07ede9264bafb67d11400996e71",
            },
            revision = 3,
        },
    },
}
