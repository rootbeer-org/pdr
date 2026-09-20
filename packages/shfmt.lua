return {
    schema = 2,
    name = "shfmt",
    description = "Format shell scripts",
    default_version = "3.14.1",
    homepage = "https://github.com/mvdan/sh",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "mvdan/sh",
        repository_id = 49766020,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/mvdan/sh/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "sh-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { shfmt = "./cmd/shfmt" },
            variables = { ["main.version"] = "v{version}" },
        },
    },
    outputs = {
        bins = { "shfmt" },
        checks = { { "shfmt", "--version" } },
    },
    versions = {
        ["3.14.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "ec4bdb88ab6c95686be3a4eeb4ad77d2b49d33d2ed7b0a65035cd52d2d87c443",
                },
            },
        },
    },
}
