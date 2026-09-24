return {
    name = "migrate",
    aliases = { "golang-migrate" },
    description = "Apply database schema migrations",
    homepage = "https://github.com/golang-migrate/migrate",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "golang-migrate/migrate",
        repository_id = 118105436,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/golang-migrate/migrate/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "migrate-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                migrate = "./cmd/migrate",
            },
            tags = {
                "file",
                "go_bindata",
                "github",
                "github_ee",
                "bitbucket",
                "aws_s3",
                "google_cloud_storage",
                "godoc_vfs",
                "gitlab",
                "postgres",
                "mysql",
                "redshift",
                "cassandra",
                "spanner",
                "cockroachdb",
                "yugabytedb",
                "clickhouse",
                "mongodb",
                "sqlserver",
                "firebird",
                "neo4j",
                "pgx",
                "pgx5",
                "rqlite",
            },
            variables = {
                ["main.Version"] = "{version}",
            },
        },
    },
    outputs = {
        bins = { "migrate" },
        checks = {
            { "migrate", "-version" },
            { "migrate", "-help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "4.20.1",
        },
        ["aarch64-macos"] = {
            default_version = "4.20.1",
        },
        ["x86_64-linux"] = {
            default_version = "4.20.1",
        },
    },
    versions = {
        ["4.20.1"] = {
            digests = {
                ["aarch64-linux"] = "365a1c5b517348301a540b04bda5d8778e61bff7e68583bcf2f278da570f4b46",
                ["aarch64-macos"] = "365a1c5b517348301a540b04bda5d8778e61bff7e68583bcf2f278da570f4b46",
                ["x86_64-linux"] = "365a1c5b517348301a540b04bda5d8778e61bff7e68583bcf2f278da570f4b46",
            },
            revision = 3,
        },
    },
}
