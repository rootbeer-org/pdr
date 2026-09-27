return {
    name = "tokei",
    description = "Count lines of code by language",
    homepage = "https://github.com/XAMPPRocky/tokei",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "XAMPPRocky/tokei",
        repository_id = 36323226,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/XAMPPRocky/tokei/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "tokei-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "tokei" },
        },
    },
    outputs = {
        bins = { "tokei" },
        checks = {
            { "tokei", "--version" },
            { "tokei", "--languages" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "15.0.0",
        },
        ["aarch64-macos"] = {
            default_version = "15.0.0",
        },
        ["x86_64-linux"] = {
            default_version = "15.0.0",
        },
    },
    versions = {
        ["15.0.0"] = {
            digests = {
                ["aarch64-linux"] = "966da7b9a81ac6cb777b9f159f4c02e5b83a8b8bd30ebf5991007839926b600c",
                ["aarch64-macos"] = "966da7b9a81ac6cb777b9f159f4c02e5b83a8b8bd30ebf5991007839926b600c",
                ["x86_64-linux"] = "966da7b9a81ac6cb777b9f159f4c02e5b83a8b8bd30ebf5991007839926b600c",
            },
        },
    },
}
