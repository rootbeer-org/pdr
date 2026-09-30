return {
    name = "ruff",
    description = "Lint and format Python code",
    homepage = "https://docs.astral.sh/ruff/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "astral-sh/ruff",
        repository_id = 523043277,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/astral-sh/ruff/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "ruff-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "ruff" },
        },
    },
    outputs = {
        bins = { "ruff" },
        checks = {
            { "ruff", "--version" },
            { "ruff", "rule", "F401" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.16.9",
        },
        ["aarch64-macos"] = {
            default_version = "0.16.9",
        },
        ["x86_64-linux"] = {
            default_version = "0.16.9",
        },
    },
    versions = {
        ["0.16.9"] = {
            digests = {
                ["aarch64-linux"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
                ["aarch64-macos"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
                ["x86_64-linux"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
            },
        },
    },
}
