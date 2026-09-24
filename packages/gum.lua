return {
    name = "gum",
    description = "Build interactive shell scripts",
    homepage = "https://github.com/charmbracelet/gum",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "charmbracelet/gum",
        repository_id = 502193049,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/charmbracelet/gum/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "gum-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gum = ".",
            },
            variables = {
                ["main.Version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "gum" },
        checks = {
            { "gum", "--version" },
            { "gum", "format", "hello" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "2.0.2",
        },
        ["aarch64-macos"] = {
            default_version = "2.0.2",
        },
        ["x86_64-linux"] = {
            default_version = "2.0.2",
        },
    },
    versions = {
        ["2.0.1"] = {
            digests = {
                ["aarch64-linux"] = "2cbc41662ff6c8df30ff3f6c133d4276db72a6f9b3df7eb942f1a798bcbf3d80",
                ["aarch64-macos"] = "2cbc41662ff6c8df30ff3f6c133d4276db72a6f9b3df7eb942f1a798bcbf3d80",
                ["x86_64-linux"] = "2cbc41662ff6c8df30ff3f6c133d4276db72a6f9b3df7eb942f1a798bcbf3d80",
            },
            revision = 3,
        },
        ["2.0.2"] = {
            digests = {
                ["aarch64-linux"] = "06403707671e9b2af386640d8b9f6079efc0aadf77e8f6b091bd191fe16c1264",
                ["aarch64-macos"] = "06403707671e9b2af386640d8b9f6079efc0aadf77e8f6b091bd191fe16c1264",
                ["x86_64-linux"] = "06403707671e9b2af386640d8b9f6079efc0aadf77e8f6b091bd191fe16c1264",
            },
        },
    },
}
