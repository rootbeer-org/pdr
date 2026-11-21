return {
    name = "age-plugin-se",
    description = "Keep age identities in the Secure Enclave",
    homepage = "https://github.com/remko/age-plugin-se",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "remko/age-plugin-se",
        repository_id = 586972173,
        tag = "v{version}",
    },
    -- TODO: Build from source once the store has a Swift toolchain.
    prebuilt = {
        github = "remko/age-plugin-se",
        tag = "v{version}",
        asset = "age-plugin-se-v{version}-macos.zip",
        dependencies = {
            { package = "7zip", kind = "build" },
        },
    },
    outputs = {
        bins = { "age-plugin-se" },
        checks = {
            { "age-plugin-se", "--version" },
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "0.2.1",
        },
    },
    versions = {
        ["0.2.1"] = {
            digests = {
                ["aarch64-macos"] = "d88104198f99441ce4b699227eacdb6e72ab67c65b2a31273aa3ccc96ef81f47",
            },
        },
    },
}
