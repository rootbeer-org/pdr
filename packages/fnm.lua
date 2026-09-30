return {
    name = "fnm",
    description = "Manage Node.js versions",
    homepage = "https://github.com/Schniz/fnm",
    recipe_maintainers = { "tale" },
    default_license = "GPL-3.0-only",
    upstream = {
        github = "Schniz/fnm",
        repository_id = 166045424,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/Schniz/fnm/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "fnm-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "fnm" },
        },
    },
    outputs = {
        bins = { "fnm" },
        checks = {
            { "fnm", "--version" },
            { "fnm", "completions", "--shell", "bash" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.39.0",
        },
        ["aarch64-macos"] = {
            default_version = "1.39.0",
        },
        ["x86_64-linux"] = {
            default_version = "1.39.0",
        },
    },
    versions = {
        ["1.39.0"] = {
            digests = {
                ["aarch64-linux"] = "224081a677a02acd9f972885e824a98fa3843f5b778b28400ad5af97752f6127",
                ["aarch64-macos"] = "224081a677a02acd9f972885e824a98fa3843f5b778b28400ad5af97752f6127",
                ["x86_64-linux"] = "224081a677a02acd9f972885e824a98fa3843f5b778b28400ad5af97752f6127",
            },
        },
    },
}
