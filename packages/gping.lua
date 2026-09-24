return {
    name = "gping",
    description = "Graph ping response times",
    homepage = "https://github.com/orf/gping",
    recipe_maintainers = { "tale" },
    default_license = "MIT",
    upstream = {
        github = "orf/gping",
        repository_id = 44440501,
        tag = "gping-v{version}",
    },
    prebuilt = {
        github = "orf/gping",
        tag = "gping-v{version}",
        asset = "gping-{target}.tar.gz",
    },
    outputs = {
        bins = { "gping" },
        checks = {
            { "gping", "--version" },
            { "gping", "--help" },
        },
    },
    platforms = {
        ["aarch64-linux"] = {
            target = "Linux-musl-arm64",
            default_version = "1.21.0",
        },
        ["aarch64-macos"] = {
            target = "macOS-arm64",
            default_version = "1.21.0",
        },
        ["x86_64-linux"] = {
            target = "Linux-musl-x86_64",
            default_version = "1.21.0",
        },
    },
    versions = {
        ["1.21.0"] = {
            digests = {
                ["aarch64-linux"] = "75e485e9ae081b4478b7c9fea0585a125dd7e640334cdbdec852af6238c3f1f1",
                ["aarch64-macos"] = "9061a06d93490f97b3a956e149d8ec4c9030625f764e8dbfac9b737c00bd9ea0",
                ["x86_64-linux"] = "cea59e22f6faf941f054cf0925433a2e3e4e6c42dc5c778b0265279a5056aeec",
            },
            revision = 2,
        },
    },
}
