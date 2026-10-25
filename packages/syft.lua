return {
    name = "syft",
    description = "Generate software bills of materials",
    homepage = "https://github.com/anchore/syft",
    recipe_maintainers = { "tale" },
    default_license = "Apache-2.0",
    upstream = {
        github = "anchore/syft",
        repository_id = 262126497,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/anchore/syft/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "syft-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                syft = "./cmd/syft",
            },
            variables = {
                ["main.version"] = "{version}",
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
        bins = { "syft" },
        checks = {
            { "syft", "version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.55.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.55.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.55.0",
        },
    },
    versions = {
        ["1.54.0"] = {
            digests = {
                ["aarch64-linux"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
                ["aarch64-macos"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
                ["x86_64-linux"] = "bcc7ef841cf0671c46b9c10cb13466a833a5a1dc010c68cc5e3658151c758c2d",
            },
        },
        ["1.55.0"] = {
            digests = {
                ["aarch64-linux"] = "d402b3988cdaea74bc01763830a6e45b4a3f1ada40f8fcad7edb5b230c18f1eb",
                ["aarch64-macos"] = "d402b3988cdaea74bc01763830a6e45b4a3f1ada40f8fcad7edb5b230c18f1eb",
                ["x86_64-linux"] = "d402b3988cdaea74bc01763830a6e45b4a3f1ada40f8fcad7edb5b230c18f1eb",
            },
        },
    },
}
