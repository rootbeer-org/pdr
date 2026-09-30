return {
    name = "broot",
    description = "Navigate directory trees",
    homepage = "https://dystroy.org/broot/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "Canop/broot",
        repository_id = 157766521,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/Canop/broot/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "broot-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "broot" },
        },
    },
    outputs = {
        bins = { "broot" },
        checks = {
            { "broot", "--version" },
            { "broot", "--print-shell-function", "bash" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.60.2",
        },
        ["aarch64-macos"] = {
            default_version = "1.60.2",
        },
        ["x86_64-linux"] = {
            default_version = "1.60.2",
        },
    },
    versions = {
        ["1.60.2"] = {
            digests = {
                ["aarch64-linux"] = "b68f641c4570e2d7bbf90613e67f9cfddf0df42da993913ddc83e7d8a4e5eae6",
                ["aarch64-macos"] = "b68f641c4570e2d7bbf90613e67f9cfddf0df42da993913ddc83e7d8a4e5eae6",
                ["x86_64-linux"] = "b68f641c4570e2d7bbf90613e67f9cfddf0df42da993913ddc83e7d8a4e5eae6",
            },
        },
    },
}
