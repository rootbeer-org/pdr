return {
    name = "jless",
    description = "View and explore JSON in the terminal",
    homepage = "https://jless.io/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "PaulJuliusMartinez/jless",
        repository_id = 361079646,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/PaulJuliusMartinez/jless/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "jless-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "jless" },
        },
    },
    outputs = {
        bins = { "jless" },
        checks = {
            { "jless", "--version" },
            { "jless", "--help" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.9.0",
        },
    },
    versions = {
        ["0.9.0"] = {
            digests = {
                ["aarch64-macos"] = "43527a78ba2e5e43a7ebd8d0da8b5af17a72455c5f88b4d1134f34908a594239",
            },
        },
    },
}
