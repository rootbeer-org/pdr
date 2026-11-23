return {
    name = "secretive",
    description = "Keep SSH keys in the Secure Enclave",
    homepage = "https://github.com/maxgoedjen/secretive",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "maxgoedjen/secretive",
        repository_id = 241524703,
        tag = "v{version}",
    },
    prebuilt = {
        github = "maxgoedjen/secretive",
        tag = "v{version}",
        asset = "Secretive.zip",
        mirror = true,
    },
    outputs = {
        apps = {
            ["Secretive.app"] = "Secretive.app",
        },
    },
    platforms = {
        ["aarch64-macos"] = {
            default_version = "4.0.0",
        },
    },
    versions = {
        ["4.0.0"] = {
            digests = {
                ["aarch64-macos"] = "877517e212938ffb7048bc7b6811e992194ba4b3eaa4dae36405b6303d1ac1fa",
            },
            trees = {
                ["aarch64-macos"] = "e77c003f9af3111bf5f25fdfc36e4bbcdadb8f2026820acc708e721e028c96c6",
            },
        },
    },
}
