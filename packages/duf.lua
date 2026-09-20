return {
    schema = 2,
    name = "duf",
    description = "Inspect filesystem disk usage",
    default_version = "0.9.1",
    homepage = "https://github.com/muesli/duf",
    systems = { "aarch64-linux", "aarch64-macos", "x86_64-linux" },
    upstream = {
        github = "muesli/duf",
        repository_id = 297165998,
        tag_prefix = "v",
    },
    inputs = {
        source = {
            url = "https://codeload.github.com/muesli/duf/tar.gz/refs/tags/{tag}",
            archive = "tar.gz",
            strip_prefix = "duf-{version}",
        },
    },
    build = {
        backend = "go",
        go = {
            binaries = { duf = "." },
            variables = { ["main.Version"] = "{version}" },
        },
    },
    outputs = {
        bins = { "duf" },
        checks = { { "duf", "--version" } },
    },
    versions = {
        ["0.9.1"] = {
            revision = 3,
            inputs = {
                source = {
                    sha256 = "1334d8c1a7957d0aceebe651e3af9e1c1e0c6f298f1feb39643dd0bd8ad1e955",
                },
            },
        },
    },
}
