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
            default_version = "0.17.5",
        },
        ["aarch64-macos"] = {
            default_version = "0.17.5",
        },
        ["x86_64-linux"] = {
            default_version = "0.17.5",
        },
    },
    versions = {
        ["0.17.4"] = {
            digests = {
                ["aarch64-linux"] = "a466d837b406c888f4f76e4be808658f36846288aa87f81ac89afcf078ad386a",
                ["aarch64-macos"] = "a466d837b406c888f4f76e4be808658f36846288aa87f81ac89afcf078ad386a",
                ["x86_64-linux"] = "a466d837b406c888f4f76e4be808658f36846288aa87f81ac89afcf078ad386a",
            },
        },
        ["0.17.5"] = {
            digests = {
                ["aarch64-linux"] = "3d920afb666d51ebec3c80ec2847ae7ad14cca3badaaf39f1c0a175d100a4506",
                ["aarch64-macos"] = "3d920afb666d51ebec3c80ec2847ae7ad14cca3badaaf39f1c0a175d100a4506",
                ["x86_64-linux"] = "3d920afb666d51ebec3c80ec2847ae7ad14cca3badaaf39f1c0a175d100a4506",
            },
        },
    },
}
