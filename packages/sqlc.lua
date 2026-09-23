return {
    name = "sqlc",
    description = "Generate typed code from SQL",
    homepage = "https://github.com/sqlc-dev/sqlc",
    default_license = "MIT",
    upstream = {
        github = "sqlc-dev/sqlc",
        repository_id = 193160679,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/sqlc-dev/sqlc/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "sqlc-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                sqlc = "./cmd/sqlc",
            },
        },
    },
    outputs = {
        bins = { "sqlc" },
        checks = {
            { "sqlc", "version" },
            { "sqlc", "generate", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "1.31.1",
        },
        ["aarch64-macos"] = {
            default_version = "1.31.1",
        },
        ["x86_64-linux"] = {
            default_version = "1.31.1",
        },
    },
    versions = {
        ["1.31.1"] = {
            digests = {
                ["aarch64-linux"] = "de82593a200e4130dc2a0413a808f93fc30fdc7b5ecd402913ed08a8fea06c4a",
                ["aarch64-macos"] = "de82593a200e4130dc2a0413a808f93fc30fdc7b5ecd402913ed08a8fea06c4a",
                ["x86_64-linux"] = "de82593a200e4130dc2a0413a808f93fc30fdc7b5ecd402913ed08a8fea06c4a",
            },
            revision = 3,
        },
    },
}
