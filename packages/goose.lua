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
        dependencies = {
            {
                package = "go",
                kind = "build",
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
            default_version = "3.30.1",
        },
        ["aarch64-macos"] = {
            default_version = "3.30.1",
        },
        ["x86_64-linux"] = {
            default_version = "3.30.1",
        },
    },
    versions = {
        ["3.30.0"] = {
            digests = {
                ["aarch64-linux"] = "60bcb9527ca286903c8f8e4cd19ce15597a7bb080e795166ea356a3e3d04a920",
                ["aarch64-macos"] = "60bcb9527ca286903c8f8e4cd19ce15597a7bb080e795166ea356a3e3d04a920",
                ["x86_64-linux"] = "60bcb9527ca286903c8f8e4cd19ce15597a7bb080e795166ea356a3e3d04a920",
            },
        },
        ["3.30.1"] = {
            digests = {
                ["aarch64-linux"] = "256e67dc83959a7febb27388d0f9b1efcc51bae5e53db31cb9bf20f3cfb468d2",
                ["aarch64-macos"] = "256e67dc83959a7febb27388d0f9b1efcc51bae5e53db31cb9bf20f3cfb468d2",
                ["x86_64-linux"] = "256e67dc83959a7febb27388d0f9b1efcc51bae5e53db31cb9bf20f3cfb468d2",
            },
        },
    },
}
