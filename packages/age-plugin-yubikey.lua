return {
    name = "age-plugin-yubikey",
    description = "Keep age identities on a YubiKey",
    homepage = "https://github.com/str4d/age-plugin-yubikey",
    recipe_maintainers = { "tale" },
    default_license = "MIT OR Apache-2.0",
    upstream = {
        github = "str4d/age-plugin-yubikey",
        repository_id = 291547252,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/str4d/age-plugin-yubikey/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "age-plugin-yubikey-{version}",
    },
    build = {
        backend = "rust",
        dependencies = {
            { package = "rust", kind = "build" },
        },
        rust = {
            packages = { "age-plugin-yubikey" },
        },
    },
    outputs = {
        bins = { "age-plugin-yubikey" },
        checks = {
            { "age-plugin-yubikey", "--version" },
        },
    },
    -- Linux needs pcsc-lite, which the store doesn't have yet.
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.5.1",
        },
    },
    versions = {
        ["0.5.1"] = {
            digests = {
                ["aarch64-macos"] = "51e4680ad7ad7f56535e4f3018531bd0196815659378709979617d4f17102700",
            },
        },
    },
}
