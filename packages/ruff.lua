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
            default_version = "0.17.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.17.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.17.0",
        },
    },
    versions = {
        ["0.16.10"] = {
            digests = {
                ["aarch64-linux"] = "c8ea3637edc68ac9d17c9143a2a432540370e3768a220b9978e931e5f89d6260",
                ["aarch64-macos"] = "c8ea3637edc68ac9d17c9143a2a432540370e3768a220b9978e931e5f89d6260",
                ["x86_64-linux"] = "c8ea3637edc68ac9d17c9143a2a432540370e3768a220b9978e931e5f89d6260",
            },
        },
        ["0.16.9"] = {
            digests = {
                ["aarch64-linux"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
                ["aarch64-macos"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
                ["x86_64-linux"] = "3b75e09dd9cf0fafbb2ae1fe13bcfdb4d43d3c07cd8578e2c48bee86b2d328e3",
            },
        },
        ["0.17.0"] = {
            digests = {
                ["aarch64-linux"] = "2df40dc573eb751154b49055d0949668ec4f72f928d9c7fe5d86f451bfb3d7d5",
                ["aarch64-macos"] = "2df40dc573eb751154b49055d0949668ec4f72f928d9c7fe5d86f451bfb3d7d5",
                ["x86_64-linux"] = "2df40dc573eb751154b49055d0949668ec4f72f928d9c7fe5d86f451bfb3d7d5",
            },
        },
    },
}
