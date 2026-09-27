return {
    name = "bacon",
    description = "Run Rust checks and tests in the background",
    homepage = "https://dystroy.org/bacon/",
    recipe_maintainers = { "tale" },
    default_license = "AGPL-3.0-only",
    upstream = {
        github = "Canop/bacon",
        repository_id = 308327979,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/Canop/bacon/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "bacon-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "bacon" },
        },
    },
    outputs = {
        bins = { "bacon" },
        checks = {
            { "bacon", "--version" },
            { "bacon", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.26.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.26.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.26.0",
        },
    },
    versions = {
        ["3.26.0"] = {
            digests = {
                ["aarch64-linux"] = "d86249d01175f83ce30c7d52d36ed3422855c7eef00907161e673d490955702d",
                ["aarch64-macos"] = "d86249d01175f83ce30c7d52d36ed3422855c7eef00907161e673d490955702d",
                ["x86_64-linux"] = "d86249d01175f83ce30c7d52d36ed3422855c7eef00907161e673d490955702d",
            },
        },
    },
}
