return {
    schema = 2,
    name = "sqlc",
    description = "Generate typed code from SQL",
    default_version = "1.31.1",
    homepage = "https://github.com/sqlc-dev/sqlc",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "sqlc-dev/sqlc",
        repository_id = 193160679,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/sqlc-dev/sqlc/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "sqlc-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { sqlc = "./cmd/sqlc" },
        },
    },
    outputs = {
        bins = { "sqlc" },
        checks = { { "sqlc", "version" }, { "sqlc", "generate", "--help" } },
    },
    versions = {
        ["1.31.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "de82593a200e4130dc2a0413a808f93fc30fdc7b5ecd402913ed08a8fea06c4a",
                },
            },
        },
    },
}
