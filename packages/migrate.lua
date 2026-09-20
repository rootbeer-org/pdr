return {
    schema = 2,
    name = "migrate",
    description = "Apply database schema migrations",
    default_version = "4.20.1",
    homepage = "https://github.com/golang-migrate/migrate",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "golang-migrate/migrate",
        repository_id = 118105436,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/golang-migrate/migrate/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "migrate-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { migrate = "./cmd/migrate" },
            tags = { "file", "go_bindata", "github", "github_ee", "bitbucket", "aws_s3", "google_cloud_storage", "godoc_vfs", "gitlab", "postgres", "mysql", "redshift", "cassandra", "spanner", "cockroachdb", "yugabytedb", "clickhouse", "mongodb", "sqlserver", "firebird", "neo4j", "pgx", "pgx5", "rqlite" },
            variables = { ["main.Version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "migrate" },
        checks = { { "migrate", "-version" }, { "migrate", "-help" } },
    },
    versions = {
        ["4.20.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "365a1c5b517348301a540b04bda5d8778e61bff7e68583bcf2f278da570f4b46",
                },
            },
        },
    },
}
