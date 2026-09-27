return {
    name = "taplo",
    description = "Format, lint, and query TOML files",
    homepage = "https://taplo.tamasfe.dev/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "tamasfe/taplo",
        repository_id = 266330343,
        tag = "{version}",
    },
    source = {
        url = "https://codeload.github.com/tamasfe/taplo/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "taplo-{version}",
    },
    build = {
        backend = "rust",
        rust = {
            packages = { "taplo-cli" },
        },
    },
    outputs = {
        bins = { "taplo" },
        checks = {
            { "taplo", "--version" },
            { "taplo", "format", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.10.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.10.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.10.0",
        },
    },
    versions = {
        ["0.10.0"] = {
            digests = {
                ["aarch64-linux"] = "c2f7b3234fc62000689a476b462784db4d1bb2be6edcc186654b211f691efaf8",
                ["aarch64-macos"] = "c2f7b3234fc62000689a476b462784db4d1bb2be6edcc186654b211f691efaf8",
                ["x86_64-linux"] = "c2f7b3234fc62000689a476b462784db4d1bb2be6edcc186654b211f691efaf8",
            },
        },
    },
}
