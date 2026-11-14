return {
    name = "oha",
    description = "Load test HTTP services",
    homepage = "https://github.com/hatoo/oha",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "hatoo/oha",
        repository_id = 244377430,
        tag = "v{version}",
    },
    prebuilt = {
        github = "hatoo/oha",
        tag = "v{version}",
        asset = "oha-{target}",
    },
    outputs = {
        bins = { "oha" },
        checks = {
            { "oha", "--version" },
            { "oha", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "linux-arm64",
            default_version = "1.17.0",
        },
        ["aarch64-macos"] = {
            target = "macos-arm64",
            default_version = "1.17.0",
        },
        ["x86_64-linux"] = {
            target = "linux-amd64",
            default_version = "1.17.0",
        },
    },
    versions = {
        ["1.16.0"] = {
            digests = {
                ["aarch64-linux"] = "99a790eb8c3e0feaca974bd6b32f0f8d4426a0c5b289f39e833e5b2c7529cd39",
                ["aarch64-macos"] = "7dea53ecb8342a7a067e1976fd0aef44ac33d9cc6b1e65c53637ffb932da63c4",
                ["x86_64-linux"] = "620bb9e16fb53eabc9a3fc45f88bdb41fefa3fee5c05e75892011ce320391716",
            },
            revision = 2,
        },
        ["1.17.0"] = {
            digests = {
                ["aarch64-linux"] = "0b360c858f6277a5fca691d38adbd2dbc8c344d049ddf1a12fee8a762351ea24",
                ["aarch64-macos"] = "2c58f2bac11ae23a12f6188a6723fd1882fa82f73d9874c2141eb78c222752c7",
                ["x86_64-linux"] = "85c6eb98066b8c8bd513b2dd96fafd8f9863249ea653606bae1ca2e3a75c43d2",
            },
        },
    },
}
