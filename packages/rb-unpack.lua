return {
    name = "rb-unpack",
    description = "Unpack DMGs, installer packages, and zips without mounting them",
    homepage = "https://rbpkg.com",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    -- Versions follow the crate in rootbeer, bumped by hand to the commit that
    -- sets each one.
    source = {
        url = "https://codeload.github.com/rootbeer-org/rootbeer/tar.gz/{commit}",
        archive = "tar.gz",
        strip_prefix = "rootbeer-{commit}",
    },
    build = {
        backend = "rust",
        dependencies = {
            -- Rootbeer's rust-toolchain.toml pins this.
            { package = "rust", version = "1.98.1", kind = "build" },
        },
        rust = {
            packages = { "rootbeer-unpack" },
        },
    },
    outputs = {
        bins = { "rb-unpack" },
        checks = {
            { "rb-unpack", "--version" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "0.1.0",
        },
        ["aarch64-macos"] = {
            default_version = "0.1.0",
        },
        ["x86_64-linux"] = {
            default_version = "0.1.0",
        },
    },
    versions = {
        ["0.1.0"] = {
            digests = {
                ["aarch64-linux"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
                ["aarch64-macos"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
                ["x86_64-linux"] = "09e58bc153abc1c21e3dc48df860216f8975312d79f6166d9cbac82ab9a06476",
            },
            commit = "33eec5c81804191937b293763142150ee9290459",
        },
    },
}
