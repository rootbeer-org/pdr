return {
    name = "gitleaks",
    description = "Detect secrets in Git repositories and files",
    homepage = "https://gitleaks.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "gitleaks/gitleaks",
        repository_id = 119190187,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/gitleaks/gitleaks/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "gitleaks-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                gitleaks = ".",
            },
            variables = {
                ["github.com/zricethezav/gitleaks/v8/version.Version"] = "{version}",
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
        bins = { "gitleaks" },
        checks = {
            { "gitleaks", "version" },
            { "gitleaks", "dir", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "8.30.1",
        },
        ["aarch64-macos"] = {
            default_version = "8.30.1",
        },
        ["x86_64-linux"] = {
            default_version = "8.30.1",
        },
    },
    versions = {
        ["8.30.1"] = {
            digests = {
                ["aarch64-linux"] = "e90fb266d75837e75894c778bf594ab8e2787f12dce5a62651f21b893eaf9abb",
                ["aarch64-macos"] = "e90fb266d75837e75894c778bf594ab8e2787f12dce5a62651f21b893eaf9abb",
                ["x86_64-linux"] = "e90fb266d75837e75894c778bf594ab8e2787f12dce5a62651f21b893eaf9abb",
            },
            revision = 2,
        },
    },
}
