return {
    name = "goose",
    description = "Run database migrations",
    homepage = "https://pressly.github.io/goose/",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "pressly/goose",
        repository_id = 52555254,
        tag = "v{version}",
    },
    source = {
        url = "https://codeload.github.com/pressly/goose/tar.gz/refs/tags/{tag}",
        archive = "tar.gz",
        strip_prefix = "goose-{version}",
    },
    build = {
        backend = "go",
        go = {
            binaries = {
                goose = "./cmd/goose",
            },
            variables = {
                ["main.version"] = "v{version}",
            },
        },
    },
    outputs = {
        bins = { "goose" },
        checks = {
            { "goose", "-version" },
            { "goose", "-h" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            default_version = "3.28.0",
        },
        ["aarch64-macos"] = {
            default_version = "3.28.0",
        },
        ["x86_64-linux"] = {
            default_version = "3.28.0",
        },
    },
    versions = {
        ["3.28.0"] = {
            digests = {
                ["aarch64-linux"] = "71644c9d60710096ecc721edba4edf44e1f53cd0417564321c4b848e26c75bfa",
                ["aarch64-macos"] = "71644c9d60710096ecc721edba4edf44e1f53cd0417564321c4b848e26c75bfa",
                ["x86_64-linux"] = "71644c9d60710096ecc721edba4edf44e1f53cd0417564321c4b848e26c75bfa",
            },
            revision = 3,
        },
    },
}
