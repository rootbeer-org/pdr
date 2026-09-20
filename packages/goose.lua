return {
    schema = 2,
    name = "goose",
    description = "Run database migrations",
    default_version = "3.28.0",
    homepage = "https://github.com/pressly/goose",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "pressly/goose",
        repository_id = 52555254,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/pressly/goose/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "goose-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { goose = "./cmd/goose" },
            variables = { ["main.version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "goose" },
        checks = { { "goose", "-version" }, { "goose", "-h" } },
    },
    versions = {
        ["3.28.0"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "71644c9d60710096ecc721edba4edf44e1f53cd0417564321c4b848e26c75bfa",
                },
            },
        },
    },
}
