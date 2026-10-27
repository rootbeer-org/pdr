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
        dependencies = {
            { package = "rust", kind = "build" },
        },
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
            default_version = "0.17.3",
        },
        ["aarch64-macos"] = {
            default_version = "0.17.3",
        },
        ["x86_64-linux"] = {
            default_version = "0.17.3",
        },
    },
    versions = {
        ["0.17.2"] = {
            digests = {
                ["aarch64-linux"] = "32bcb3363a9b5e0111c25c5cd50069b2bd92e370695ba981d5dfbc48e7ecb1a0",
                ["aarch64-macos"] = "32bcb3363a9b5e0111c25c5cd50069b2bd92e370695ba981d5dfbc48e7ecb1a0",
                ["x86_64-linux"] = "32bcb3363a9b5e0111c25c5cd50069b2bd92e370695ba981d5dfbc48e7ecb1a0",
            },
        },
        ["0.17.3"] = {
            digests = {
                ["aarch64-linux"] = "7281befde89b669bd92231064ceb3d3211d9094e20e6983bb3b92e641b305860",
                ["aarch64-macos"] = "7281befde89b669bd92231064ceb3d3211d9094e20e6983bb3b92e641b305860",
                ["x86_64-linux"] = "7281befde89b669bd92231064ceb3d3211d9094e20e6983bb3b92e641b305860",
            },
        },
    },
}
